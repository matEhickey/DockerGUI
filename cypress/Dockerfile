# FROM cypress/included:3.2.0

# curl
# RUN sed -i -e 's/us.archive.ubuntu.com/archive.ubuntu.com/g' /etc/apt/sources.list
# RUN apt-get update
# RUN apt-get install curl -y
# RUN apt-get install apt-transport-https -y


# RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
# RUN apt-get update
# RUN apt-get install nodejs -y


# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# RUN apt-get update

# RUN apt-get install --no-install-recommends yarn -y
# RUN yarn global add cypress --dev
# RUN cypress install --force

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
CMD /usr/bin/bash
