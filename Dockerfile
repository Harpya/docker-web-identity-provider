FROM d9magai/http2apache:latest

LABEL AUTHOR="Eduardo Luz <eduardo@eduardo-luz.com>"
LABEL PROJECT="Harpya <https://www.harpya.net>"

EXPOSE 80

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

RUN mkdir /usr/local/apache2/conf/conf.d && mkdir /usr/local/apache2/conf/sites.d

COPY conf.d/* /usr/local/apache2/conf/conf.d/
COPY sites.d/* /usr/local/apache2/conf/sites.d/

COPY ./tmp/app/public /var/www/html/public
COPY start.sh /root

RUN adduser www-data \
    && chmod 755 /root/start.sh \ 
    && mkdir -p /srv/logs/web

CMD [ "/root/start.sh" ]