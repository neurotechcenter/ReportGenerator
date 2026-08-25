import os
import re
from pathlib import Path
from tkinter import filedialog
import argparse
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

def plot_orthogonal_imaging(
            imaging: nib.spatialimages.SpatialImage,
            electrode_name: str,
            electrode_position: np.ndarray,
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

            axes[1, 1].set_facecolor("black")
            axes[1, 1].axis("off")
            axes[1, 1].text(
                  0.5,
                  0.5,
                  electrode_name,
                  color="white",
                  fontsize=16,
                  ha="center",
                  va="center",
                  transform=axes[1, 1].transAxes,
            )

            fig.suptitle(f"{electrode_name}", color="white")
            fig.tight_layout(rect=(0.0, 0.06, 1.0, 0.97))
            return fig

def save_electrode_report(
            imaging: nib.spatialimages.SpatialImage,
            electrodes: dict[str, np.ndarray],
            subject: str,
            report_path: Path = None
) -> None:
            """Save one orthogonal-view page per electrode to a PDF report."""
            if report_path is None:
                  report_path = f'{subject}.pdf'
            sorted_electrodes = dict(sorted(electrodes.items(), key=lambda item: natural_sort_key(item[0])))
            total_electrodes = len(sorted_electrodes)
            with PdfPages(report_path) as pdf:
                  for idx, (electrode_name, electrode_position) in enumerate(sorted_electrodes.items(), start=1):
                        fig = plot_orthogonal_imaging(imaging, electrode_name, electrode_position)
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
img_dir = rootDir/'IMAGING'/'NIfTI'
elec_dir = rootDir/'IMAGING'/'electrodes'
electrodes = load_electrodes_from_dat(elec_dir)
img_path = img_dir / imgType / f"{'r' if rFlag else ''}{imgType}.img"
imaging = nib.load(img_path)
report_path = save_electrode_report(imaging, electrodes, subject = f'{rootDir.name}_{imgType}',report_path=args.reportPath)
print(f"Saved report to {report_path}")

