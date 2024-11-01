FROM ubuntu:jammy
RUN apt update && apt-get install  software-properties-common -y\
&& add-apt-repository ppa:ondrej/php && apt update && \
DEBIAN_FRONTEND=noninteractive apt-get install git python-is-python3 python3-xdg software-properties-common  php5.6 \
php5.6-gd php5.6-mysql php5.6-imap php5.6-curl \
php5.6-intl php5.6-pspell php5.6-recode php5.6-sqlite3 php5.6-tidy \
php5.6-xmlrpc php5.6-xsl php5.6-zip php5.6-mbstring php5.6-soap \
php5.6-opcache libicu70 php5.6-common php5.6-json php5.6-readline \
php5.6-xml libapache2-mod-php5.6 php5.6-cli wget -y && update-alternatives --config php \
&& a2enmod php5.6
RUN wget -O install_via_bootstrap.sh https://github.com/rlabduke/MolProbity/raw/master/install_via_bootstrap.sh \
&& chmod +x install_via_bootstrap.sh && ./install_via_bootstrap.sh 4 && cd /molprobity \
&& cat setup.sh | sed -n -e '1,/run/p' >>setup.sh || ./setup.sh
WORKDIR /molprobity
CMD ["/usr/bin/php","-S","0.0.0.0:8000"]
