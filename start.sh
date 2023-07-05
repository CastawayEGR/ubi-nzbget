#!/bin/bash

if [ ! -f /config/nzbget.conf ]
then
	cp ./nzbget.conf /config/
fi

./nzbget -s -o outputmode=log -c /config/nzbget.conf
