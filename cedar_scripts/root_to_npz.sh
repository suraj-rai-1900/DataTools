#!/bin/bash
#SBATCH --account=rpp-blairt2k
#SBATCH --cpus-per-task=5
#SBATCH --time=0-23:00:00 
#SBATCH --mem=200GB

module load StdEnv/2016
module load python/3.6.3

source /home/surajrai/scratch/DataTools/cedar_scripts/sourceme.sh
mkdir /home/surajrai/scratch/outputs_npz

for ((i=0; i<10; i++))
do
    lb=$((1000*i + 1))  # Calculate the lower bound
    hb=$((1000*(i+1)) + 1)  # Calculate the upper bound
    sbatch <<EOF
#!/bin/bash
#SBATCH --account=rpp-blairt2k
#SBATCH --cpus-per-task=5
#SBATCH --time=1-10:00:00 
#SBATCH --mem=200GB

python root_utils/npz_prod.py -s "$lb" -p "$hb" -o /home/surajrai/scratch/outputs_npz/
EOF
done

