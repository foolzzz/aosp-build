FROM ubuntu:14.04

ARG userid
ARG groupid
ARG username

# ubuntu 14.04
RUN apt-get update && apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip python openjdk-7-jdk sudo vim

# install jdk8
RUN curl -o jdk8.tgz https://android.googlesource.com/platform/prebuilts/jdk/jdk8/+archive/master.tar.gz \
 && tar -zxf jdk8.tgz linux-x86 \
 && mv linux-x86 /usr/lib/jvm/java-8-openjdk-amd64 \
 && rm -rf jdk8.tgz

# install repo
RUN curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo \
 && chmod a+x /usr/local/bin/repo

# install openssl1.0
RUN apt-get install -y wget libssl-dev
RUN wget --no-check-certificate https://www.openssl.org/source/openssl-1.1.1q.tar.gz \
  && tar -zxvf openssl-1.1.1q.tar.gz

# create user
RUN groupadd -g $groupid $username \
 && useradd -m -u $userid -g $groupid $username \
 && echo $username >/root/username \
 && echo "" > /home/${username}/.gitconfig


RUN echo ${username}:admin | chpasswd \
 && echo "${username}  ALL=(ALL)  NOPASSWD:ALL" >> /etc/sudoers

RUN chown $userid:$groupid /home/$username/.gitconfig

RUN locale-gen zh_CN.UTF-8 \
 && locale-gen en_US.UTF-8
 
RUN echo 'export LC_ALL=C' > tmp1 \
 && echo 'export LANG="en_US.UTF-8"' >> tmp1 \
 && echo 'export USE_CCACHE=1' >> tmp1 \
 && echo '# prebuilts/misc/linux-x86/ccache/ccache -M 50G' >> tmp1 \
 && echo "export USER=$username" >> tmp1 \
 && echo "" >> tmp1 \
 && cat tmp1 >> ~/.bashrc \
 && cat tmp1 >> /home/${username}/.bashrc

ENV HOME=/home/$username
ENV USER=$username

ENTRYPOINT chroot --userspec=$(cat /root/username):$(cat /root/username) / /bin/bash -i