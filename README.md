# Osteocyte Connectomics
This is the _MATLAB_ code used in the paper __"The small world of osteocytes: connectomics of the osteocyte lacuno-canalicular network"__ (New J. Phys. 19 073019, https://doi.org/10.1088/1367-2630/aa764b) from the raw confocal image data.

This repository is essentially a clone of the original ( https://github.com/phi-max/OCY_connectomics ) with updated Mex Files and C+ Wrappers included for the paper __"Disrupted Osteocyte Connectivity and Pericellular Fluid Flow in Bone with Aging and Defective TGFb Signaling"__ by Schurman et. al. (10.1073/pnas.2023999118)https://www.pnas.org/content/118/25/e2023999118/tab-article-info This repository contains the scripts to complete osteocyte connectomics analysis from confocal image data.


## Dependencies
The following external dependencies need to be in your MATLAB path:

- _Skeleton3D_ (https://github.com/phi-max/skeleton3d-matlab)
- _Skel2Graph3D_ (https://github.com/phi-max/skel2graph3d-matlab)
- _MatlabBGL_ by David Gleich (https://github.com/dgleich/matlab-bgl/)

## How to run
Two scripts need to be called to generate the plots. All other `.m` files and external dependencies (see above) must be on your _MATLAB_ path. The data should be located in the current working directory.

1. `OCY_analyze_all.m`: main script to analyze data, using parallel pool if available.
2. `OCY_main.m`: master script called by `OCY_analyza_all.m` and contains additional operations and options for analysis 

## Data structures
Data structures are saved as `.mat` files of the same name as the variable in each folder.

- **bin_thr**: Binary image volume after smoothing and thresholding.
- **bin**: Binary image volume after morphological filtering.
- **cell**: Binary volume containing only the cells.
- **skel_ini**: Initial result of 3D thinning.
- **skel**: Final result of 3D thinning after filtering and cleaning.
- **dist**: Distance transform of the complete network.
- **celldist**: Distance transform of the cells only.
- **didx**: Index of the closest canalicular voxel.
- **node**: Struct containing all nodes with their properties.
- **link**: Struct containing all links with their properties.
- **cell**: Struct containing all cells with their properties.
- **A**: Connectivity matrix, where A<sub>ij</sub> ist the length of a link between nodes i and j.
- **n**: Struct containing the results of the topological analysis.
