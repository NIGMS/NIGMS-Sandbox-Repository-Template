FROM gcr.io/deeplearning-platform-release/workbench-container:latest 

COPY update_config.sh /

RUN chmod +x /update_config.sh && /update_config.sh

RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc && \
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

RUN apt install r-base r-base-dev build-essential \
libcurl4-gnutls-dev libxml2-dev libssl-dev libharfbuzz-dev \
libfribidi-dev libgit2-dev  libfontconfig1-dev libfreetype6-dev \
libpng-dev libtiff5-dev libjpeg-dev  libcairo2-dev -y

ENV MAMBA_ROOT_PREFIX=/opt/micromamba

RUN micromamba create -n test -c conda-forge -y

SHELL ["micromamba", "run", "-n", "jupyterlab", "/bin/bash", "-c"]

COPY add_r_kernel.sh /

RUN chmod +x /add_r_kernel.sh && /add_r_kernel.sh

RUN pip install psutil==6.0.0 && apt install cmake -y && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
