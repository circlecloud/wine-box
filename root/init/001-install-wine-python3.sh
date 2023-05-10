#!/usr/bin/env bash
set -ex
function pyok() {
    while :
    do
        NOTFOUND=`wine python --version | grep 3.9` || true
        if [ "$NOTFOUND" != "" ]; then
            rm python-3.9.16.exe
            break
        fi
        sleep 1
    done
}
pyok &
wget https://www.python.org/ftp/python/3.9.16/python-3.9.16.exe
# start install
wine start python-3.9.16.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
wait
sleep 5