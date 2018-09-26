#!/bin/bash
bash check.sh & stdbuf -oL python start.py | tee output.txt
rm output.txt

wait

echo "DONE!"
