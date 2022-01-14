#!/bin/bash
python3 -c "
import glob
import os
p = [x for x in glob.glob('**/*', recursive=True) if 'index.html' in x]
for i in p:
        main_dir = i.split('/')[0]
        os.system(f'brave-browser --headless --screenshot={main_dir}/image.png {main_dir}/index.html')
        with open(f'{main_dir}/README.md', 'w+') as f:
                f.write('![im](image.png)')
"
if [[ ! -z $1 ]]; then
        git add . && git commit -m $1 && git push
fi
