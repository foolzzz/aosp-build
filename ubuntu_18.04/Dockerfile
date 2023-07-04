FROM ubuntu:18.04

ARG userid
ARG groupid
ARG username

# ubuntu 18.04
RUN apt-get update && apt-get install -y apt-utils bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush pngquant rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openssl m4 repo python mtd-utils uuid-dev texinfo u-boot-tools locales util-linux openjdk-8-jdk sudo vim

RUN sed -i 's/^jdk.tls.disabledAlgorithms=.*/jdk.tls.disabledAlgorithms=\\/g' /etc/java-8-openjdk/security/java.security

# install repo
RUN curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo \
 && chmod a+x /usr/local/bin/repo

# create user
RUN groupadd -g $groupid $username \
 && useradd -m -u $userid -g $groupid $username \
 && echo $username >/root/username \
 && echo "export USER="$username >>/home/$username/.gitconfig

RUN echo ${username}:admin | chpasswd \
 && echo "${username}  ALL=(ALL)       ALL" >> /etc/sudoers

RUN chown $userid:$groupid /home/$username/.gitconfig

RUN locale-gen zh_CN.UTF-8 \
 && locale-gen en_US.UTF-8 \
 && echo 'export LC_ALL=C' >> ~/.bashrc \
 && echo 'export LANG="en_US.UTF-8"' >> ~/.bashrc \
 && echo "" >> ~/.bashrc

ENV HOME=/home/$username
ENV USER=$username

ENTRYPOINT chroot --userspec=$(cat /root/username):$(cat /root/username) / /bin/bash -i
