#!/bin/bash

echo docker pull filebrowser/filebrowser
echo mkdir -p ~/filebrowser/root
echo touch ~/filebrowser/filebrowser.db
echo docker run -dp 1111:80 \
-v $HOME/filebrowser/root:/srv \
-v $HOME/filebrowser/filebrowser.db:/database.db \
-v $HOME/filebrowser/filebrowser.json:/.filebrowser.json \
--name filebrowser filebrowser/filebrowser
