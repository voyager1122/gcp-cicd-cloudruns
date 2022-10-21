#---------------------------------------------------------------------------
# Dockefile to build Docker Image with Apache WebServer running on Ubuntu
# Copyleft (c) by Denis Astahov
#---------------------------------------------------------------------------

FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN apt-get -y update
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y install tzdata
RUN apt-get -y install apache2

RUN echo 'Docker Image on CloudRun!<br>'   > /var/www/html/index.html
RUN echo '<b><font color="magenta">Version 1.0</font></b>' >> /var/www/html/index.html

CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]
EXPOSE 80
