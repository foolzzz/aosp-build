FROM ubuntu:20.04

ARG userid
ARG groupid
ARG username

# ubuntu 20.04
RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai apt-get install -y apt-utils bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush pngquant rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openssl m4 python3 mtd-utils uuid-dev texinfo u-boot-tools locales util-linux openjdk-8-jdk sudo

# install repo
RUN curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo \
 && chmod a+x /usr/local/bin/repo

# create user
RUN groupadd -g $groupid $username \
 && useradd -m -u $userid -g $groupid $username \
 && echo $username >/root/username \
 && echo "export USER="$username >>/home/$username/.gitconfig

RUN echo ${username}:admin | chpasswd \
 && echo "tom  ALL=(ALL)       ALL" >> /etc/sudoers

RUN chown $userid:$groupid /home/$username/.gitconfig

RUN locale-gen zh_CN.UTF-8 \
 && locale-gen en_US.UTF-8 \
 && echo 'export LC_ALL=C' >> ~/.bashrc \
 && echo 'export LANG="en_US.UTF-8"' >> ~/.bashrc \
 && echo "" >> ~/.bashrc

ENV HOME=/home/$username
ENV USER=$username

ENTRYPOINT chroot --userspec=$(cat /root/username):$(cat /root/username) / /bin/bash -i

