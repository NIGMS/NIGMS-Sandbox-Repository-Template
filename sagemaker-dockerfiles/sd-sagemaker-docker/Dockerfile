FROM continuumio/miniconda3:23.3.1-0
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
    apt-get install --yes --no-install-recommends \
    fonts-dejavu \
    sudo \
    unzip \
    libgl1-mesa-glx \
    xvfb \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install jupyterlab urllib3==1.26.6 PyQt5 ete3
    
RUN conda config --add channels conda-forge --add channels bioconda
RUN conda update --all --override-channels -c conda-forge --yes
RUN conda install mamba
RUN mamba install --quiet --yes -c conda-forge \
    'boto3' \
    'sagemaker' \
    'fastqc' \
    'multiqc' \
    'mafft' \
    'fasttree' \
    'clustalw' \
    'iqtree' \
    'blast' \
    'biopython' \
    'matplotlib' \
    'beast'

RUN mamba install --quiet --yes usher && conda install mamba -y
RUN mamba clean --all -f -y  && chown ${NB_UID} /opt/conda -R
RUN usermod -a -G  sudo ${NB_USER} && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    chmod 777 /opt/conda -R

WORKDIR $HOME
USER ${NB_UID}

CMD jupyter lab --ip 0.0.0.0 --port 8888 \
  --ServerApp.base_url="/jupyterlab/default" \
  --ServerApp.token='' \
  --ServerApp.allow_origin='*'
