#!/usr/bin/env bash
if [ $# -eq 0 ]
  then
    tag='latest'
  else
    tag=$1
fi

docker build -t atomdocker:$tag .
cp -f docker-cli-atom.sh /opt/docker-cli-atom.sh
cp -f AtomDocker.desktop /usr/share/applications/AtomDocker.desktop
cp -f atomdocker.png /usr/share/icons/atomdocker.png
