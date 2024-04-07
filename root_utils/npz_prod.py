from event_dump import dump_file
import argparse

home_path = "/project/rpp-blairt2k/rakutsu/iwcd/mc/MassProNov2020/files/wcsim_root/NuMode/2p39/iwcd_p320ka_w750m_1e17pot_2p39_wcsim."
def get_args():
    parser = argparse.ArgumentParser(description='convert root files to npz')
    parser.add_argument('-s', '--start_num', type=int)
    parser.add_argument('-p', '--stop_num', type=int)
    parser.add_argument('-o', '--out_folder', type=str)
    args = parser.parse_args()
    return args

def dump_batch(start, stop, out_folder):
    for i in range(start, stop):
        in_fpath = home_path +"%s.root"%(str(i).zfill(5))
        print(in_fpath)
        out_fpath = out_folder + "iwcd_p320ka_w750m_1e17pot_2p39_wcsim_%s.npz"%(str(i).zfill(5))
        dump_file(in_fpath, out_fpath)

if __name__ == '__main__':
    config = get_args()
    print(config.start_num, config.stop_num, config.out_folder)
    print("starting dump")
    dump_batch(config.start_num, config.stop_num, config.out_folder)
