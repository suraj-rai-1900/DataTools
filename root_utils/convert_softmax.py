import ROOT
import numpy as np
from root_file_utils import convert
import argparse
import os
#Converts a list of softmax from a given folder from numpy to root
#Outputs it in a new folder that gets created based on the name of the first folder 
# also created a txt files with the filenames inside
def get_args():
    parser = argparse.ArgumentParser(description='convert and merge .npz files to hdf5')
    parser.add_argument('in_path', type=str, nargs='+')
    parser.add_argument('-o', '--out_path', type=str)
    args = parser.parse_args()
    return args

if __name__=="__main__":
    config = get_args()   
    dir_inpath = config.in_path[0]
    print(dir_inpath)
    dir_outpath = config.out_path + '_root/'
    files = sorted([f for f in os.listdir(dir_inpath) if os.path.isfile(os.path.join(dir_inpath, f))])
    out_fnames = []
    for f in files:
        fpath = dir_inpath + f
        f_name = f[:-4] + '.root'
        outpath = dir_outpath + f_name
        convert(fpath, outpath)
        out_fnames.append(f_name)
    
    with open(dir_inpath+ "/softmaxes.txt", "w") as f:
        for file in out_fnames:
            f.write(file + "\n")
