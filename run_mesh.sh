#!/bin/bash
#SBATCH --job-name=stirring
#SBATCH --time=4:00:00
#SBATCH --ntasks=36
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=3G

module load OpenFOAM/v2206-foss-2022a
. ${FOAM_BASH}

rm -r 0 1 2 3
cp -r C0.orig 0
surfaceFeatureExtract
blockMesh
decomposePar
mpirun -np 36 snappyHexMesh -parallel -overwrite
reconstructParMesh -constant

