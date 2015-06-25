FROM ubuntu:trusty

RUN apt-get update

### utility di base
RUN apt-get install -y git curl wget unzip

### java per comprimere i file js e css
RUN apt-get install -y default-jre

### bower per scaricare le dipendenze js e css di frontend
RUN apt-get install -y npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install --global bower

### less per compilare i file less
RUN npm install --global less

# HHVM come engine PHP per lanciare composer
RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN echo deb http://dl.hhvm.com/ubuntu trusty main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get update -qq && apt-get install -y -qq hhvm
RUN echo "date.timezone = Europe/Rome" >> /etc/hhvm/php.ini

# install composer PHP packaging utility
RUN wget -O /usr/local/bin/composer -q http://getcomposer.org/composer.phar
RUN chmod +x /usr/local/bin/composer

# alla partenza vai nella cartella wa
WORKDIR /wa/







