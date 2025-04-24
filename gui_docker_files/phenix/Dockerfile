FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy
RUN apt update && apt install unzip wget python3-xdg -y
COPY phenix-installer-1.21.2-5419-intel-linux-2.6-x86_64-centos6.tar.gz  /
RUN tar xvzf phenix-installer-1.21.2-5419-intel-linux-2.6-x86_64-centos6.tar.gz && \
cd phenix* && ./install
COPY /root /
