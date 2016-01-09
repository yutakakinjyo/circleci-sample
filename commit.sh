#!/bin/sh

git config --global user.email "yutakakinjyo+bot@gmail.com"
git config --global user.name "ci-check"
./a.out > report.txt
git add report.txt

re=`git status -s | grep "^[MAD]" | cut -f 3 -d " "`
if [ $re -eq  "report.txt" ] ;then
    git commit -m "report is changed [ci skip]"
fi

git push origin `git rev-parse --abbrev-ref HEAD`



