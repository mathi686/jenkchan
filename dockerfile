FROM centos:7

#CMD yum install -y yum-utils
#CMD yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

RUN yum install httpd -y

COPY index.html var/www/html/index.html

EXPOSE 80

CMD apachectl -D FOREGROUND


