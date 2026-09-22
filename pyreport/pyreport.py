import os
import re
from pathlib import Path
from tkinter import filedialog
import argparse
from typing import Any
import numpy as np
import nibabel as nib
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
from matplotlib.colors import PowerNorm
from nibabel.orientations import aff2axcodes, axcodes2ornt

def parse_args() -> argparse.Namespace:
      parser = argparse.ArgumentParser(
            description="Generate an electrode localization report with VERA outputs.",
      )
      parser.add_argument(
            "--rootDir",
            type=Path,
            default=None,
            help="Patient Folder, will be prompted with file dialog if not included.",
      )
      parser.add_argument(
            "--imgtype",
            type=str,
            default='MRI',
            help="imaging type, match the name of the folder in the patient NIfTI imaging folder defaults to MRI.",
      )
      parser.add_argument(
            "--reportPath",
            type=Path,
            default=None,
            help="Path to the output PDF report. Defaults to None, will save the report as subjectName.pdf in the called directory",
      )
      parser.add_argument(
            "--brainPath",
            type=Path,
            default=None,
            help="Path to the VERA/PyBrain .mat brain model. Defaults to the first model found under rootDir/brain.",
      )
      parser.add_argument(
            "--annot",
            action=argparse.BooleanOptionalAction,
            default=True,
            help="Use PyBrain annotation colors for the brain surface. Enabled by default; use --no-annot for a gray glass brain.",
      )
      return parser.parse_args()

def load_electrodes_from_dat(electrodeDir:Path)-> dict:
            """Load electrodes from dat."""
            if not os.path.exists(electrodeDir):
                  raise FileNotFoundError
            if not isinstance(electrodeDir,Path): electrodeDir=Path(electrodeDir)
            electrodes = {}
            for f in electrodeDir.glob("*.dat"):
                  with open(f,'r') as fp:
                        name = f.name.replace('.dat','')
                        lines = fp.readlines()
                        lines = [i.strip() for i in lines]
                        n_points = int(lines[lines.index('info')+1].split(' ')[-1])
                        try:  electrodes.update({f'{name}_{idx+1}':np.array(i.split(),dtype=float) for idx,i in enumerate(lines[1:n_points+1])}) 
                        except ValueError: electrodes.update({f'{name}_{idx+1}':np.array(i.split(),dtype=float) for idx,i in enumerate(lines[0:n_points])}) 
            return electrodes

def print_progress(current: int, total: int) -> None:
            """Render a simple terminal progress bar."""
            bar_width = 30
            filled = int(bar_width * current / total) if total else bar_width
            bar = "=" * filled + "-" * (bar_width - filled)
            print(f"\rGenerating report [{bar}] {current}/{total}", end="", flush=True)
            if current == total:
                  print()

def natural_sort_key(value: str) -> list[object]:
            """Return a key that sorts embedded digit runs numerically."""
            return [int(part) if part.isdigit() else part.lower() for part in re.split(r"(\d+)", value)]

def shank_name(electrode_name: str) -> str:
            """Return the electrode shank prefix from a generated electrode label."""
            return re.sub(r"[_-]?\d+$", "", electrode_name)

def shank_points(electrode_name: str, electrodes: dict[str, np.ndarray]) -> np.ndarray:
            """Return all coordinates belonging to the same shank as one electrode."""
            target_shank = shank_name(electrode_name)
            points = [
                  position
                  for name, position in sorted(electrodes.items(), key=lambda item: natural_sort_key(item[0]))
                  if shank_name(name) == target_shank
            ]
            if len(points) == 0:
                  return np.empty((0, 3), dtype=float)
            return np.asarray(points, dtype=float)

def shank_hemisphere(electrode_name: str, points: np.ndarray, electrode_position: np.ndarray) -> str:
            """Infer the shank hemisphere from label first, then RAS x-coordinate."""
            label = shank_name(electrode_name).upper()
            if label.startswith("L"):
                  return "left"
            if label.startswith("R"):
                  return "right"
            if len(points) > 0:
                  x_position = float(np.nanmean(points[:, 0]))
            else:
                  x_position = float(electrode_position[0])
            return "right" if x_position >= 0 else "left"

def unit_vector(vector: np.ndarray) -> np.ndarray:
            """Return a unit-length vector, or zeros for a degenerate vector."""
            norm = np.linalg.norm(vector)
            if norm < 1e-9:
                  return np.zeros_like(vector, dtype=float)
            return np.asarray(vector, dtype=float) / norm

def shank_major_axis(points: np.ndarray) -> np.ndarray:
            """Return the principal axis of the shank coordinates."""
            if len(points) < 2:
                  return np.array([0.0, 0.0, 1.0])
            centered = points - np.nanmean(points, axis=0)
            if np.linalg.norm(centered) < 1e-9:
                  return np.array([0.0, 0.0, 1.0])
            _, _, vh = np.linalg.svd(centered, full_matrices=False)
            return unit_vector(vh[0])

def orthogonal_camera_direction(axis: np.ndarray, hemisphere: str) -> np.ndarray:
            """Return a side-prioritized camera direction orthogonal to an axis."""
            side_direction = np.array([-1.0, 0.0, 0.0]) if hemisphere == "left" else np.array([1.0, 0.0, 0.0])
            axis = unit_vector(axis)
            projected_side = side_direction - np.dot(side_direction, axis) * axis
            projected_side = unit_vector(projected_side)
            if np.linalg.norm(projected_side) > 0:
                  return projected_side

            fallback = np.cross(axis, np.array([0.0, 0.0, 1.0]))
            if np.linalg.norm(fallback) < 1e-9:
                  fallback = np.cross(axis, np.array([0.0, 1.0, 0.0]))
            return unit_vector(fallback)

def camera_view_up(camera_direction: np.ndarray) -> np.ndarray:
            """Return a stable superior-facing camera up vector."""
            superior = np.array([0.0, 0.0, 1.0])
            view_up = superior - np.dot(superior, camera_direction) * camera_direction
            if np.linalg.norm(view_up) < 1e-9:
                  anterior = np.array([0.0, 1.0, 0.0])
                  view_up = anterior - np.dot(anterior, camera_direction) * camera_direction
            return unit_vector(view_up)

def bounds_parallel_scale(
            bounds: np.ndarray,
            center: np.ndarray,
            camera_direction: np.ndarray,
            view_up: np.ndarray,
) -> float:
            """Return a parallel camera scale that centers and fits brain bounds."""
            right = unit_vector(np.cross(camera_direction, view_up))
            corners = np.array(
                  [
                        [x, y, z]
                        for x in (bounds[0], bounds[1])
                        for y in (bounds[2], bounds[3])
                        for z in (bounds[4], bounds[5])
                  ],
                  dtype=float,
            )
            centered_corners = corners - center
            half_width = float(np.max(np.abs(centered_corners @ right)))
            half_height = float(np.max(np.abs(centered_corners @ view_up)))
            return max(half_width, half_height) * 1.08

def set_brain_camera_for_shank(
            plotter: Any,
            electrode_name: str,
            points: np.ndarray,
            electrode_position: np.ndarray,
            brain_bounds: tuple[float, float, float, float, float, float],
) -> None:
            """Rotate the glass brain orthogonal to the shank axis with hemisphere priority."""
            hemisphere = shank_hemisphere(electrode_name, points, electrode_position)
            major_axis = shank_major_axis(points)
            camera_direction = orthogonal_camera_direction(major_axis, hemisphere)
            view_up = camera_view_up(camera_direction)

            plotter.reset_camera()
            bounds = np.asarray(brain_bounds, dtype=float)
            brain_center = np.array(
                  [
                        np.mean(bounds[0:2]),
                        np.mean(bounds[2:4]),
                        np.mean(bounds[4:6]),
                  ],
                  dtype=float,
            )
            bounds_size = np.array(
                  [
                        bounds[1] - bounds[0],
                        bounds[3] - bounds[2],
                        bounds[5] - bounds[4],
                  ],
                  dtype=float,
            )
            bounds_diag = np.linalg.norm(bounds_size)
            camera_distance = max(float(getattr(plotter.camera, "distance", 0.0)), bounds_diag * 1.8, 250.0)
            plotter.camera.focal_point = tuple(brain_center)
            plotter.camera.position = tuple(brain_center + camera_direction * camera_distance)
            plotter.camera.up = tuple(view_up)
            plotter.camera.parallel_projection = True
            plotter.camera.parallel_scale = bounds_parallel_scale(
                  bounds,
                  brain_center,
                  camera_direction,
                  view_up,
            )
            plotter.reset_camera_clipping_range()

def find_brain_model(root_dir: Path, brain_path: Path | None = None) -> Path | None:
            """Find a PyBrain/VERA .mat brain model for the report."""
            if brain_path is not None:
                  return brain_path if brain_path.exists() else None
            search_dirs = [
                  root_dir / "brain",
                  root_dir / "IMAGING" / "brain",
                  root_dir / "VERA" / "DataOutput",
            ]
            search_dirs.extend(sorted(root_dir.glob("VERA*/DataOutput"), key=lambda path: natural_sort_key(path.name)))
            patterns = (
                  "brain_cortex.mat",
                  "patient_brain.mat",
                  "brain.mat",
                  "brain_MNI.mat",
                  "*.mat",
            )
            for search_dir in search_dirs:
                  if not search_dir.exists():
                        continue
                  for pattern in patterns:
                        matches = sorted(search_dir.glob(pattern), key=lambda path: natural_sort_key(path.name))
                        if len(matches) > 0:
                              return matches[0]
            return None

def pyvista_faces(tris: np.ndarray) -> np.ndarray:
            """Return PyVista face cells from triangular vertex indices."""
            tris = np.asarray(tris, dtype=int)
            tris = tris - np.min(tris)
            return np.column_stack([np.full(len(tris), 3, dtype=int), tris]).ravel()

def preferred_annotation_colors(brain_model: Any, annot: np.ndarray) -> np.ndarray:
            """Return per-vertex RGB colors from PyBrain annotation PreferredColor values."""
            color_map = {
                  label["Identifier"]: np.asarray(label["PreferredColor"], dtype=float).reshape(-1)[:3]
                  for label in brain_model.surfaceModel.AnnotationLabel
            }
            colors = np.ones((len(annot), 3), dtype=float)
            for identifier, color in color_map.items():
                  colors[np.asarray(annot) == identifier] = color
            if np.nanmax(colors) <= 1.0:
                  colors = np.clip(colors * 255.0, 0.0, 255.0)
            else:
                  colors = np.clip(colors, 0.0, 255.0)
            return colors.astype(np.uint8)

def plot_annotated_brain_surface(
            plotter: Any,
            brain_model: Any,
            opacity: float = 0.35,
            lighting: bool = True,
) -> tuple[Any, tuple[float, float, float, float, float, float]]:
            """Plot brain surface with parcel PreferredColor values as true RGB colors."""
            import pyvista as pv

            cortex = brain_model.surfaceModel.Model
            verts = np.asarray(cortex.vert)
            faces = pyvista_faces(cortex.tri)
            colors = preferred_annotation_colors(brain_model, brain_model.surfaceModel.Annotation)
            cloud = pv.PolyData(verts, faces)
            cloud.point_data["ParcelRGB"] = colors
            plotter.add_mesh(
                  cloud,
                  smooth_shading=True,
                  scalars="ParcelRGB",
                  rgb=True,
                  opacity=opacity,
                  show_edges=False,
                  lighting=lighting,
            )
            return plotter, cloud.bounds

def load_brain_model(brain_path: Path | None, subject: str) -> Any | None:
            """Load a PyBrain model when the required package stack is available."""
            if brain_path is None:
                  return None
            try:
                  from PyBrain.modules.VERA_PyBrain import PyBrain
            except ImportError as err:
                  print(f"PyBrain import failed, skipping brain surface panel: {err}")
                  return None
            try:
                  return PyBrain(brain_path, subject=subject, brainName=brain_path.stem, bipolar=False)
            except Exception as err:
                  print(f"PyBrain model load failed for {brain_path}, skipping brain surface panel: {err}")
                  return None

def render_brain_shank(
            brain_model: Any,
            electrodes: dict[str, np.ndarray],
            electrode_name: str,
            electrode_position: np.ndarray,
            annot: bool,
) -> np.ndarray | None:
            """Render the brain surface and current electrode shank as an RGB image."""
            try:
                  import pyvista as pv
            except ImportError as err:
                  print(f"PyVista import failed, skipping brain surface panel: {err}")
                  return None
            try:
                  plotter = brain_model.generateAxis(
                        figname=f"{electrode_name}_surface",
                        background="black",
                        off_screen=True,
                  )
                  plotter.window_size = (900, 900)
                  if annot:
                        _, brain_bounds = plot_annotated_brain_surface(
                              plotter,
                              brain_model,
                              opacity=0.35,
                              lighting=True,
                        )
                  else:
                        _, brain_bounds = brain_model.plotBrainVolume(
                              plotter,
                              opacity=0.18,
                              color=(0.82, 0.82, 0.82),
                              lighting=True,
                              returnBounds=True,
                        )

                  points = shank_points(electrode_name, electrodes)
                  if len(points) > 1:
                        line = pv.lines_from_points(points)
                        plotter.add_mesh(line.tube(radius=0.45), color=(1.0, 0.85, 0.15), lighting=False)
                  if len(points) > 0:
                        shank_mesh = pv.PolyData(points)
                        shank_glyphs = shank_mesh.glyph(scale=False, geom=pv.Sphere(radius=1.6), orient=False)
                        plotter.add_mesh(shank_glyphs, color=(1.0, 0.85, 0.15), lighting=False)

                  active_mesh = pv.PolyData(np.asarray(electrode_position, dtype=float).reshape(1, 3))
                  active_glyph = active_mesh.glyph(scale=False, geom=pv.Sphere(radius=2.8), orient=False)
                  plotter.add_mesh(active_glyph, color=(1.0, 0.0, 0.0), lighting=False)

                  set_brain_camera_for_shank(
                        plotter,
                        electrode_name,
                        points,
                        electrode_position,
                        brain_bounds,
                  )
                  image = plotter.screenshot(return_img=True)
                  plotter.close()
                  return image
            except Exception as err:
                  print(f"Brain surface render failed for {electrode_name}: {err}")
                  return None

def plot_orthogonal_imaging(
            imaging: nib.spatialimages.SpatialImage,
            electrode_name: str,
            electrode_position: np.ndarray,
            electrodes: dict[str, np.ndarray] | None = None,
            brain_model: Any | None = None,
            annot: bool = True,
) -> plt.Figure:
            """Create orthogonal grayscale views centered on one electrode."""
            data = imaging.get_fdata()
            vmin, vmax = np.percentile(data, (1.0, 99.8))
            norm = PowerNorm(gamma=0.8, vmin=vmin, vmax=vmax)
            codes = axcodes2ornt(aff2axcodes(imaging.affine))
            order = np.argsort([code[0] for code in codes])
            flips = np.array([code[1] < 0 for code in codes])[order]
            voxel_position = np.dot(
                  np.linalg.inv(imaging.affine),
                  np.append(electrode_position.astype(float), 1.0),
            )[:3]
            data_idx = []
            for axis in order:
                  voxel_idx = int(round(voxel_position[axis]))
                  voxel_idx = max(0, min(voxel_idx, data.shape[axis] - 1))
                  data_idx.append(voxel_idx)
            mr_voxel = np.array(data_idx, dtype=float)
            mr_voxel_by_axis = np.zeros(3, dtype=float)
            for ii, axis in enumerate(order):
                  mr_voxel_by_axis[axis] = mr_voxel[ii]
            mr_ras = np.dot(imaging.affine, np.append(mr_voxel_by_axis, 1.0))[:3]
            electrode_ras_text = (
                  f"Electrode RAS: R={electrode_position[0]:.1f}, "
                  f"A={electrode_position[1]:.1f}, "
                  f"S={electrode_position[2]:.1f}"
            )
            mr_ras_text = (
                  f"MR RAS: R={mr_ras[0]:.1f}, "
                  f"A={mr_ras[1]:.1f}, "
                  f"S={mr_ras[2]:.1f}"
            )

            orthogonal_views = []
            direction_labels = (
                  ("S", "A", "I", "P"),
                  ("S", "R", "I", "L"),
                  ("A", "R", "P", "L"),
            )
            for ii, view_name in enumerate(("Sagittal", "Coronal", "Axial")):
                  view = np.rollaxis(data, axis=order[ii])[data_idx[ii]]
                  xax = [1, 0, 0][ii]
                  yax = [2, 2, 1][ii]
                  if order[xax] < order[yax]:
                        view = view.T
                  if flips[xax]:
                        view = view[:, ::-1]
                  if flips[yax]:
                        view = view[::-1]
                  marker_x = voxel_position[order[xax]]
                  marker_y = voxel_position[order[yax]]
                  if flips[xax]:
                        marker_x = view.shape[1] - 1 - marker_x
                  if flips[yax]:
                        marker_y = view.shape[0] - 1 - marker_y
                  labels = direction_labels[ii]
                  if ii in (1, 2):
                        view = view[:, ::-1]
                        marker_x = view.shape[1] - 1 - marker_x
                        labels = (labels[0], labels[3], labels[2], labels[1])
                  orthogonal_views.append(
                        (view, f"{view_name} slice={data_idx[ii]}", marker_x, marker_y, labels)
                  )

            fig, axes = plt.subplots(2, 2, figsize=(10, 10), facecolor="black")
            plot_axes = [axes[0, 0], axes[0, 1], axes[1, 0]]
            for ax, (view, title, marker_x, marker_y, labels) in zip(plot_axes, orthogonal_views):
                  ax.set_facecolor("black")
                  ax.imshow(view, cmap="gray", origin="lower", norm=norm)
                  ax.scatter(marker_x, marker_y, c="r", s=18, marker="x", linewidths=0.8)
                  ax.set_title(title, color="white")
                  ax.axis("off")
                  ax.text(0.99, 0.5, labels[1], color="white", ha="right", va="center", transform=ax.transAxes)
                  ax.text(0.01, 0.5, labels[3], color="white", ha="left", va="center", transform=ax.transAxes)
                  ax.text(0.02, -0.12, electrode_ras_text, color="white", fontsize=7, ha="left", va="top", transform=ax.transAxes)
                  ax.text(0.02, -0.18, mr_ras_text, color="white", fontsize=7, ha="left", va="top", transform=ax.transAxes)

            brain_ax = axes[1, 1]
            brain_ax.set_facecolor("black")
            brain_ax.axis("off")
            brain_image = None
            if brain_model is not None and electrodes is not None:
                  brain_image = render_brain_shank(
                        brain_model,
                        electrodes,
                        electrode_name,
                        electrode_position,
                        annot,
                  )
            if brain_image is not None:
                  brain_ax.imshow(brain_image)
                  brain_ax.set_title("Brain surface / shank", color="white")
            else:
                  brain_ax.text(
                        0.5,
                        0.5,
                        electrode_name,
                        color="white",
                        fontsize=16,
                        ha="center",
                        va="center",
                        transform=brain_ax.transAxes,
                  )

            fig.suptitle(f"{electrode_name}", color="white")
            fig.tight_layout(rect=(0.0, 0.06, 1.0, 0.97))
            return fig

def save_electrode_report(
            imaging: nib.spatialimages.SpatialImage,
            electrodes: dict[str, np.ndarray],
            subject: str,
            report_path: Path | None = None,
            brain_model: Any | None = None,
            annot: bool = True,
) -> Path:
            """Save one orthogonal-view page per electrode to a PDF report."""
            if report_path is None:
                  report_path = Path(f'{subject}.pdf')
            sorted_electrodes = dict(sorted(electrodes.items(), key=lambda item: natural_sort_key(item[0])))
            total_electrodes = len(sorted_electrodes)
            with PdfPages(report_path) as pdf:
                  for idx, (electrode_name, electrode_position) in enumerate(sorted_electrodes.items(), start=1):
                        fig = plot_orthogonal_imaging(
                              imaging,
                              electrode_name,
                              electrode_position,
                              electrodes=sorted_electrodes,
                              brain_model=brain_model,
                              annot=annot,
                        )
                        pdf.savefig(fig, facecolor=fig.get_facecolor())
                        plt.close(fig)
                        print_progress(idx, total_electrodes)
            return report_path


args = parse_args()
userpath = Path(os.path.expanduser('~'))
# args.rootDir = Path('/Users/nkb/Library/CloudStorage/Box-Box/BJH078')
if args.rootDir is None:
      rootDir = filedialog.askdirectory(initialdir=userpath/'Documents')
else:
      rootDir = Path(args.rootDir)
imgType =  args.imgtype
if imgType != 'MRI': rFlag=True
else: rFlag=False
print(f'Directory Structure is valid: {(os.path.exists(rootDir) and os.path.isdir(rootDir))}\n{rootDir}')
elec_dir = rootDir/'IMAGING'/'electrodes'
try:
      electrodes = load_electrodes_from_dat(elec_dir)
except FileNotFoundError:
      elec_dir = rootDir/'electrodes'
      electrodes = load_electrodes_from_dat(elec_dir)
      
img_dir = rootDir/'IMAGING'/'NIfTI'
if not os.path.exists(img_dir): img_dir = rootDir/'NIfTI'
img_path = img_dir / imgType / f"{'r' if rFlag else ''}{imgType}.img"
imaging = nib.load(img_path)
brain_path = find_brain_model(rootDir, args.brainPath)
brain_model = load_brain_model(brain_path, subject=rootDir.name)
report_path = save_electrode_report(
      imaging,
      electrodes,
      subject = f'{rootDir.name}_{imgType}',
      report_path=args.reportPath,
      brain_model=brain_model,
      annot=args.annot,
)
print(f"Saved report to {report_path}")
