lightweight python program (>= python 3.11) for report generation analogous to the main matlab tool.

parent directory requires:
- NIfTI folder
- Electrodes folder
- VERA folder (optional)
NIfTI and Electrodes folders can be contained within an enclosing 'IMAGING' folder or standalone. 

cmd line arguments:
	--rootDir : patient root box folder
	--imgType : NIfTI subfolder for different contrasts, defaults to MRI
	--reportPath : output filename for report, defaults to patientID_imgType.pdf where this command is called.
