FROM alpine:latest
RUN \
    apk add --no-cache \
    apache2 \
    php7 \
    php7-apache2 \
    php7-mbstring \
    git

WORKDIR /var/www/localhost/htdocs

RUN git clone https://github.com/denlulung/landing-page.git
RUN mv /var/www/localhost/htdocs/landing-page/* /var/www/localhost/htdocs/
RUN rm -rf /var/www/localhost/htdocs/landing-page

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
