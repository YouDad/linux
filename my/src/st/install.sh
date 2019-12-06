#!/bin/bash

make install

if [[ "$?" != "0" ]]; then
	exit $?
fi

make clean

if [[ "$?" != "0" ]]; then
	exit $?
fi
