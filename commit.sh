#!/bin/sh

./a.out > report.txt
git add report.txt

re=`git status -s | grep "^[MAD]" | cut -f 3 -d " "`
if [ "$re" = "report.txt" ]; then
    git commit -m "report is changed [ci skip]"
    git push origin `git rev-parse --abbrev-ref HEAD`
fi





