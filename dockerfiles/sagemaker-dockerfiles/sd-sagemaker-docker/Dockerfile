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
    unzip \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install jupyterlab && python3 -m pip install --upgrade pip &&  python3 -m pip install --upgrade urllib3==1.26.6
    
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


WORKDIR $HOME
USER ${NB_UID}

CMD jupyter lab --ip 0.0.0.0 --port 8888 \
  --ServerApp.base_url="/jupyterlab/default" \
  --ServerApp.token='' \
  --ServerApp.allow_origin='*'
