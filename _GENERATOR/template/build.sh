#!/usr/bin/env bash
if [ $# -eq 0 ]
  then
    tag='latest'
  else
    tag=$1
fi

docker build -t templatedocker:$tag .
cp -f docker-cli-template.sh /opt/docker-cli-template.sh
cp -f TemplateDocker.desktop /usr/share/applications/TemplateDocker.desktop
cp -f templatedocker.png /usr/share/icons/templatedocker.png
