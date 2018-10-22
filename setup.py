import os

def main():
    #print(__file__)
    cmd = ' '.join(['jupyter','kernelspec','install', os.path.dirname(__file__)])
    #print(cmd)    
    os.system(cmd)

if __name__ == "__main__":
    main()