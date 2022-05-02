#!/bin/bash
BASEDIR=`pwd`
#PYTHON_PATH="/home/project/venv/bin/python"

prepareforUpdate() {
    cd $BASEDIR
    #$PYTHON_PATH -m pip install -r requirements.txt
    if [ ! -d /var/log/synap/ ]; then
        mkdir -p /var/log/synap/
    fi
}

updateCode() {
    cd $BASEDIR
    if [ ! -d /tmp/github2/rajac123/ ]; then
        mkdir /tmp/github2/rajac123
    fi
    rsync -aSP $BASEDIR/tmp/github/rajac123  /tmp/github2/rajac123/ --delete --exclude .env
    cd $BASEDIR
    #systemctl daemon-reload
}



restartServices() {
    systemctl enable synap.service
    systemctl restart synap.service
    sleep 5
}


#prepareforUpdate
updateCode
#restartServices
