#!/bin/bash

URL=$1
folder="$HOME/repo/web_electron/${URL//\//_}"

mkdir -p "$folder"

cat > "$folder/index.js" << EOF
const { app, BrowserWindow, Menu } = require('electron')
Menu.setApplicationMenu(null);
app.on('ready', ()=>{
	let win = new BrowserWindow()
	win.loadURL('$URL')
})
EOF

cat > "$folder/package.json" << EOF
{
  "name": "web_electron",
  "version": "1.0.0",
  "main": "index.js",
  "license": "MIT"
}
EOF

electron "$folder"
