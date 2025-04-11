FROM continuumio/miniconda3
ARG NB_USER="sagemaker-user"
ARG NB_UID="1000"
ARG NB_GID="100"

ENV NB_USER=$NB_USER \
    NB_UID=$NB_UID \
    NB_GID=$NB_GID \
    HOME=/home/$NB_USER


USER root
RUN useradd --non-unique --create-home --shell /bin/bash --gid "${NB_GID}" --uid ${NB_UID} "sagemaker-user"
# R pre-requisites

RUN apt-get update --yes && \
    apt-get install --yes software-properties-common lsb-release && \
    gpg --keyserver keyserver.ubuntu.com  --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' && \
    gpg --armor --export '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' | tee /etc/apt/trusted.gpg.d/cran_debian_key.asc && \
    echo "deb http://cloud.r-project.org/bin/linux/debian bookworm-cran40/" | tee -a /etc/apt/sources.list

RUN apt update && apt-get install --yes --no-install-recommends \
    libcurl4-openssl-dev \
    cmake \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    awscli \
    gcc \
    r-base \
    r-base-dev \
    build-essential \ 
    libxml2-dev \
    libssl-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libgit2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev  \
    libjpeg-dev \
    libmagick++-dev \
    sudo \
    libhdf5-dev \
    libcairo2-dev -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install jupyterlab && python3 -m pip install --upgrade pip &&  python3 -m pip install --upgrade urllib3==1.26.6
    
# R packages including IRKernel which gets installed globally.
# r-e1071: dependency of the caret R package
RUN conda config --add channels conda-forge &&\
    conda update --all --override-channels -c conda-forge --yes && \
    conda install mamba && \
    mamba install --quiet --yes  -c conda-forge -c \
    bioconda \
    boto3 \
    sagemaker \
    trimmomatic \
    fastqc \
    multiqc \
    sql-magic \
    entrez-direct \
    gffread \
    parallel-fastq-dump \
    sra-tools \
    sql-magic \
    pyathena \
    samtools \
    star \
    rsem \
    entrez-direct \
    subread \
    salmon \
    pigz \
    unixodbc \
    cutadapt \
    gsutil && \
    mamba clean --all -f -y 

COPY add_r_kernel.sh /
RUN chmod +x /add_r_kernel.sh && \
    /add_r_kernel.sh && \
#    chmod +x /add_r_kernel2.sh && \
#    /add_r_kernel2.sh && \
    chown ${NB_UID}:${NB_GID} /usr/local/lib/R -R
ENV PKG_CONFIG_PATH=/opt/conda/lib/pkgconfig/
COPY add_r_kernel2.sh /
RUN chmod +x /add_r_kernel2.sh
#RUN    /add_r_kernel2.sh
RUN usermod -a -G  sudo ${NB_USER} && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN chown ${NB_UID}:${NB_GID} /opt/conda/lib/R -R

WORKDIR $HOME
USER ${NB_UID}
RUN sudo /add_r_kernel2.sh

CMD jupyter lab --ip 0.0.0.0 --port 8888 \
  --ServerApp.base_url="/jupyterlab/default" \
  --ServerApp.token='' \
  --ServerApp.allow_origin='*'
