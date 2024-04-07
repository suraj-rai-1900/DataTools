#!/bin/bash
#SBATCH --account=rpp-blairt2k
#SBATCH --time=0-24:30 
#SBATCH --mem=200G  
#SBATCH --cpus-per-task=3

source /home/surajrai/scratch/DataTools/cedar_scripts/sourceme.sh
source /home/surajrai/scratch/env/bin/activate
pip install --no-index --upgrade pip
pip install --no-index h5py
mkdir -p /home/surajrai/scratch/outputs_h5/

for ((i=0; i<10; i++))
do
    sbatch <<EOF
#!/bin/bash
#SBATCH --account=rpp-blairt2k
#SBATCH --cpus-per-task=5
#SBATCH --time=1-10:00:00 
#SBATCH --mem=200GB

lb=$((1000*i + 1))  # Calculate the lower bound
hb=$((1000*(i+1)))  # Calculate the upper bound
for ((j=\$lb; j<=\$hb; j++))
do
    input_file="/home/surajrai/scratch/outputs_npz/iwcd_p320ka_w750m_1e17pot_2p39_wcsim_\$(printf '%05d' \$j).npz"
    out_fpath="/home/surajrai/scratch/outputs_h5/iwcd_p320ka_w750m_1e17pot_2p39_wcsim_\$(printf '%05d' \$j).h5"

    python /home/surajrai/scratch/DataTools/root_utils/np_to_digihit_array_hdf5.py \$input_file -o \$out_fpath
done
EOF
done
