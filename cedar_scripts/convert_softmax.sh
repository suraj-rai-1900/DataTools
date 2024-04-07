#!/bin/bash
#SBATCH --account=rpp-blairt2k
#SBATCH --time=0-05:30:00
#SBATCH --mem=200G  
#SBATCH --cpus-per-task=3

source /home/surajrai/scratchDataTools/cedar_scripts/sourceme.sh

python /home/surajrai/scratch/DataTools/root_utils/convert_softmax.py "/home/surajrai/scratch/softmaxes_watchmal/"
