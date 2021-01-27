FROM geerlingguy/docker-ubuntu2004-ansible:latest
RUN apt-get update -y && apt-get install -y aptitude build-essential python3-pip python3 python3-apt aptitude python-apt tree cron curl dumb-init
RUN apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql
RUN pip3 install ansible ansible-runner ruamel.yaml
RUN mkdir -p /app/roles/wp-ansible/{tasks,defaults}

COPY requirements.yml examples/base.yaml /app/
RUN cd /app && ansible-galaxy install -r requirements.yml

COPY ./tasks ./defaults /app/roles/wp-ansible/
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu

WORKDIR /app

