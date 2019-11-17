#!/bin/bash
source ../preinstall.sh

if [[ "$USER" != "root" ]]; then
	echo "need root privilege"
	exit 1 fi

wget --continue https://cdn.tcotp.cn:4443/client/Sakura_frpc_linux_amd64.tar.gz
check_retval "wget --continue https://cdn.tcotp.cn:4443/client/Sakura_frpc_linux_amd64.tar.gz"

tar axf Sakura_frpc_linux_amd64.tar.gz
check_retval "tar axf Sakura_frpc_linux_amd64.tar.gz"

rm Sakura_frpc_linux_amd64.tar.gz
check_retval "rm Sakura_frpc_linux_amd64.tar.gz"

mv Sakura_frpc_linux_amd64 SakuraFrpc
check_retval "mv Sakura_frpc_linux_amd64 SakuraFrpc"

mkdir /opt/SakuraFrpc
check_retval "mkdir /opt/SakuraFrpc"

mv SakuraFrpc /opt/SakuraFrpc/
check_retval "mv SakuraFrpc /opt/SakuraFrpc/"

echo "\
[Unit]
Description=Sakura Frp Client
Wants=network-online.target
After=network-online.target
[Service]
User=root
WorkingDirectory=/opt/sakurafrp/
LimitNOFILE=4096
PIDFile=/var/run/sakurafrp/client.pid
ExecStart=/opt/sakurafrp/SakuraFrpc --su=* --sp=* --sid=*
Restart=on-failure
StartLimitInterval=600
[Install]
WantedBy=multi-user.target\
" > /etc/systemd/system/SakuraFrpc.service
check_retval "echo > /etc/systemd/system/SakuraFrpc.service"

vim /etc/systemd/system/SakuraFrpc.service
check_retval "vim /etc/systemd/system/SakuraFrpc.service"
