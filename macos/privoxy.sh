#!/bin/bash

mkdir -p ~/soft/privoxy
cd ~/soft/privoxy
echo $(pwd)

wget https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt

pip install --user gfwlist2privoxy

python ~/Library/Python/2.7/lib/python/site-packages/gfwlist2privoxy/main.py -i gfwlist.txt -f gfwlist.action -p 127.0.0.1:1086 -t socks5

if [ -z $(which privoxy) ]
then
    echo "installing privoxy"
    brew install privoxy

    echo "configuring privoxy"
    echo "actionsfile gfwlist.action" >> /usr/local/etc/privoxy/config
fi

cp gfwlist.action /usr/local/etc/privoxy/

brew services restart privoxy

echo "done"
