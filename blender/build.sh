#!/usr/bin/env bash
if [ $# -eq 0 ]
  then
    tag='latest'
  else
    tag=$1
fi

docker build -t blenderdocker:$tag .
cp -f docker-cli-blender.sh /opt/docker-cli-blender.sh
cp -f BlenderDocker.desktop /usr/share/applications/BlenderDocker.desktop
cp -f blenderdocker.png /usr/share/icons/blenderdocker.png
