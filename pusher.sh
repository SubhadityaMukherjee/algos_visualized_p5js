#!/bin/python3
import glob
import os
import argparse

ap = argparse.ArgumentParser()
ap.add_argument("-n")
ag = ap.parse_args()

p = [x for x in glob.glob('**/*', recursive=True) if 'index.html' in x]
for i in p:
    main_dir = i.split('/')[0]
    os.system(f'brave-browser --headless --screenshot="{main_dir}/image.png" "{main_dir}/index.html"')
    with open(f'{main_dir}/README.md', 'w+') as f:
            f.write('![im](./image.png)')

if ag.n!=None:
    os.system(f"git add . && git commit -m {ag.n} && git push")
