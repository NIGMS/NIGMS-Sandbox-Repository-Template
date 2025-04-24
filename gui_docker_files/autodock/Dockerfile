FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy
RUN apt update
RUN apt-get install wget python3-xdg git build-essential autoconf csh -y
# Install Autodock4
RUN wget https://autodock.scripps.edu/wp-content/uploads/sites/56/2021/10/autodocksuite-4.2.6-x86_64Linux2.tar && \
    tar -xvf autodocksuite-4.2.6-x86_64Linux2.tar && \
    mv x86_64Linux2/* /usr/local/bin 

RUN git clone https://github.com/ccsb-scripps/AutoGrid && \
    cd AutoGrid && \
    autoreconf -i  && \
    mkdir Linux64 && \
    cd Linux64 && \
    ../configure && \
    make && \
    make install 
# Install MGLtools
RUN wget https://ccsb.scripps.edu/mgltools/download/491/ -O mgltools.tar.gz && \
    tar -xvzf mgltools.tar.gz && \
    cd mgltools_x86_64Linux2_1.5.7 && \
    ./install.sh
RUN rm mgltools.tar.gz autodocksuite-4.2.6-x86_64Linux2.tar
ENV PATH="$PATH:/mgltools_x86_64Linux2_1.5.7/bin"
COPY /root /
