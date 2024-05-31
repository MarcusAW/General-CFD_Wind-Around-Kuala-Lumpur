#!/bin/bash
#SBATCH --job-name=KL_Solve
#SBATCH --time=48:00:00
#SBATCH --ntasks=36
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=1G

module load OpenFOAM/v2206-foss-2022a
. ${FOAM_BASH}

reconstructParMesh
rm -r proc*
decomposePar
renumberMesh -overwrite
mpirun -np 36 simpleFoam -parallel

