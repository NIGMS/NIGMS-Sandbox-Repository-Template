FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy
RUN apt update && apt install unzip wget python3-xdg -y
RUN wget https://github.com/asl/BandageNG/releases/download/v2022.09/BandageNG-9eb84c2-x86_64.AppImage && \
chmod a+x BandageNG-9eb84c2-x86_64.AppImage
COPY /root /
CMD ["sleep", "infinity"]
