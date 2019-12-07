#!/bin/bash

echo "cd $MY_LINK/"
cd $MY_LINK/
if [[ "$?" != "0" ]]; then
	exit $?
fi

echo "rm -rf wiki/preview"
rm -rf wiki/preview
if [[ "$?" != "0" ]]; then
	exit $?
fi

echo "find wiki/ -type d | sed 's/^wiki/wiki\/preview/' | xargs mkdir -v"
find wiki/ -type d | sed 's/^wiki/wiki\/preview/' | xargs mkdir -v
if [[ "$?" != "0" ]]; then
	exit $?
fi

echo "cd wiki/"
cd wiki/
if [[ "$?" != "0" ]]; then
	exit $?
fi

echo "find -name \"*.md\" | sed 's/\.\///g' | xargs -I{} i5ting_toc -f {}"
find -name "*.md" | sed 's/\.\///g' | xargs -I{} i5ting_toc -f {}
if [[ "$?" != "0" ]]; then
	exit $?
fi
