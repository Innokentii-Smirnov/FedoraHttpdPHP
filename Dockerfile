FROM fedora
RUN dnf install -y httpd php php-fpm supervisor && \
    dnf clean all
RUN mkdir -p /var/www && \
    mkdir -p /var/www/html && \
    mkdir -p /run/php-fpm && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisord.d
ADD supervisord.ini /etc/supervisord.d/supervisord.ini
ADD *.php /var/www/html
CMD ["/usr/bin/supervisord"]
