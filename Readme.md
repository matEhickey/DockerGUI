# DOCKER GUI containers

## HOW-TO:  

### TLDR: 
Wait for the yeoman generator.

Or:
- duplicate '\_GENERATOR/template' to wherever you want, 
- customise the scripts by renaming all 'template' stuff / change the icon
- install what you want into the Dockerfile
- launch:
~~~sh
sudo ./build.sh
~~~

### Detailed configuration
Create the base Dockerfile from ubuntu, install your program and add the config:  
~~~sh
FROM ubuntu:14.04

RUN apt-get update && apt-get install -y <program>

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
CMD /usr/bin/<program>
~~~

Create a script to run the container in /opt/ (chomd +x, /opt because in PATH):  
~~~sh
#!/bin/bash
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <container tag>
~~~

Create the desktop shortcut and add it to /usr/share/applications  
~~~sh
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=true (some program require a terminal)
Exec=/opt/<script running the container>
Name=<Name>
Comment=<Command>
Icon=<path to icon (probably in /usr/share/icons/)>
~~~

Create the icon:
- you can use the gimp template provided in '/\_GENERATOR/IconCreator/'