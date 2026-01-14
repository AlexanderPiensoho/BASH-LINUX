#!/usr/bin/env bash

update="apt update"
upgrade="apt upgrade -y"
install="apt install -y"
$update

$install ssh  &> /dev/null
systemctl enable --now ssh.socket


echo "Hardening the ssh config..."
tee /etc/ssh/sshd_config.d/hardening.conf > /dev/null << EOF
Port 7722
PasswordAuthentication no
PermitRootLogin no
AllowUsers a p t
MaxAuthTries 4
PubkeyAuthentication yes
KbdInteractiveAuthentication no
EOF

systemctl daemon-reload
systemctl restart ssh.socket

echo "installing and enabling firewalld"
$install firewalld  &> /dev/null
systemctl unmask --now firewalld.service
systemctl enable --now firewalld.service
firewall-cmd --add-port=7722/tcp --permanent
firewall-cmd --reload

systemctl mask ufw.service

echo "Installing docker..."
apt remove "$(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)"

$install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

$update 

$install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl start docker

$update && $upgrade

groupmod -aU a,p,t docker
