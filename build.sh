#!/usr/bin/env bash

if [ -z $1 ];
then
        VERSION="0.0.1"
else
        VERSION="$1"
fi


# git clone https://github.com/Harpya/identity-provider.git tmp && cd tmp && git checkout master && cd ..

docker build --tag harpya/web-identity-provider:${VERSION} .

# rm -rf tmp
