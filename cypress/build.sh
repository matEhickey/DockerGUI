#!/usr/bin/env bash
if [ $# -eq 0 ]
  then
    tag='latest'
  else
    tag=$1
fi

docker build -t cypressdocker:$tag .
cp -f docker-cli-cypress.sh /opt/docker-cli-cypress.sh
cp -f CypressDocker.desktop /usr/share/applications/CypressDocker.desktop
cp -f cypressdocker.png /usr/share/icons/cypressdocker.png
