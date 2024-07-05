#!/bin/bash

source /home/surajrai/scratch/DataTools/cedar_sripts/sourceme.sh
cd /home/surajrai/scratch/Analysis_mod/RecoAnalysis/bin/

for ((i=1; i<10000; i++)); do 
    ./make_dataset /project/rpp-blairt2k/rakutsu/iwcd/mc/MassProNov2020/files/fq_root/NuMode/2p39/iwcd_p320ka_w750m_1e17pot_2p39_fitqun.$(printf '%05d' $i).root /home/surajrai/projects/def-blairt2k/surajrai/backup/softmax_root/softmax_$(printf '%05d' $i).root /home/surajrai/scratch/analysis_data/combined_data_$(printf '%05d' $i).root
done
