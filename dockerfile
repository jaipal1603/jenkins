FROM centos:latest

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*

RUN sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install httpd zip unzip -y

RUN wget -O /var/www/html/finexo.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/finexo.zip

WORKDIR /var/www/html

RUN unzip finexo.zip

RUN cp -rf finexo-html/* . &&\
rm -rf finexo-html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
