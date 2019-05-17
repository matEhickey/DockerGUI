#!/usr/bin/env bash
if [ $# -eq 0 ]
  then
    tag='latest'
  else
    tag=$1
fi

docker build -t firefoxdocker:$tag .
cp -f docker-cli-firefox.sh /opt/docker-cli-firefox.sh
cp -f FirefoxDocker.desktop /usr/share/applications/FirefoxDocker.desktop
cp -f firefoxdocker.png /usr/share/icons/firefoxdocker.png
