#!/bin/bash
#SBATCH --account=rpp-blairt2k
#SBATCH --time=0-24:30
#SBATCH --mem=200G
#SBATCH --cpus-per-task=3

source /home/surajrai/scratch/DataTools/cedar_scripts/sourceme.sh
source /home/surajrai/scratch/env/bin/activate
pip install --no-index --upgrade pip
pip install --no-index h5py
mkdir /home/surajrai/scratch/outputs_h5_combined/

input_files=($(ls /home/surajrai/scratch/outputs_npz/*.npz))
out_fpath="/home/surajrai/scratch/outputs_h5_combined/iwcd_p320ka_w750m_1e17pot_2p39_wcsim_combined.h5"

python /home/surajrai/scratch/DataTools/root_utils/np_to_digihit_array_hdf5.py "${input_files[@]}" -o "$out_fpath"
