#!/bin/bash

rm -f config.h
sudo make install

if [[ "$?" != "0" ]]; then
	exit $?
fi

rm -f config.h
sudo make clean

if [[ "$?" != "0" ]]; then
	exit $?
fi
