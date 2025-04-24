FROM gcr.io/deeplearning-platform-release/workbench-container:latest 

COPY update_config.sh /

RUN chmod +x /update_config.sh && /update_config.sh

RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc && \
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" && \
wget https://github.com/iqtree/iqtree2/releases/download/v2.3.6/iqtree-2.3.6-Linux-intel.tar.gz && \
tar -zxvf iqtree-2.3.6-Linux-intel.tar.gz && \
mv iqtree-2.3.6-Linux-intel/bin/iqtree2 /usr/bin/ && \
chmod +x /usr/bin/iqtree2 && \
wget http://phylosolutions.com/paup-test/paup4a169_ubuntu64.gz && \
gzip -d paup4a169_ubuntu64.gz && \
mv paup4a169_ubuntu64 /usr/bin/paup4 && \
chmod +x /usr/bin/paup4

RUN add-apt-repository ppa:deadsnakes/ppa && apt install r-base r-base-dev build-essential \
libcurl4-gnutls-dev libxml2-dev libssl-dev libharfbuzz-dev \
libfribidi-dev libgit2-dev  libfontconfig1-dev libfreetype6-dev \
libpng-dev libtiff5-dev libjpeg-dev  libcairo2-dev libgfortran5 libpython2.7-dev -y

ENV MAMBA_ROOT_PREFIX=/opt/micromamba

RUN micromamba create -n test -c conda-forge -y

RUN micromamba install -n jupyterlab  -c conda-forge libgfortran4 -y && ln -s /opt/micromamba/envs/jupyterlab/lib/libgfortran.so.4 /usr/lib/libgfortran.so.4

SHELL ["micromamba", "run", "-n", "jupyterlab", "/bin/bash", "-c"]

COPY add_r_kernel.sh /

RUN chmod +x /add_r_kernel.sh && /add_r_kernel.sh

RUN ln -s /usr/bin/micromamba /opt/micromamba/bin/mamba && /opt/micromamba/bin/pip install psutil==6.1.1 && apt install cmake -y && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
