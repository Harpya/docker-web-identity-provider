#!/bin/bash

export WEB_HOSTNAME=$(hostname)

echo "Starting... "

if [ ! -d /srv/logs/web ]
then
    mkdir /srv/logs/web 2> /dev/null
fi

if [ ! -d /srv/logs/web/${WEB_HOSTNAME} ]
then
    mkdir /srv/logs/web/${WEB_HOSTNAME} 2> /dev/null
fi

chmod 777 -R /srv/logs/web

/usr/local/apache2/bin/httpd

 while :; do echo 'Hit CTRL+C' > /dev/null; sleep 60; done
 
