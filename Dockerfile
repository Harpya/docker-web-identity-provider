FROM ubuntu AS stage1

RUN apt-get update && apt-get install -y git \
    && cd /root \
    && git clone https://github.com/Harpya/identity-provider.git ./tmp \
    && cd tmp && git checkout master 

FROM d9magai/http2apache:latest AS stage2

LABEL AUTHOR="Eduardo Luz <eduardo@eduardo-luz.com>"
LABEL PROJECT="Harpya <https://www.harpya.net>"

EXPOSE 80

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

RUN mkdir /usr/local/apache2/conf/conf.d && mkdir /usr/local/apache2/conf/sites.d

COPY conf.d/* /usr/local/apache2/conf/conf.d/
COPY sites.d/* /usr/local/apache2/conf/sites.d/

COPY --from=stage1 /root/tmp/app/public /var/www/html/public
COPY start.sh /root

RUN adduser www-data \
    && chmod 755 /root/start.sh \ 
    && mkdir -p /srv/logs/web

CMD [ "/root/start.sh" ]