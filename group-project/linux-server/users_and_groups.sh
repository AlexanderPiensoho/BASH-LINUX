#!/usr/bin/env bash

set -e

if [ "$EUID" -ne 0 ]; then 
    echo "Detta script måste köras med sudo."
    echo "Startar om scriptet med sudo..."
    exec sudo "$0" "$@"
fi

GROUP_NAME="gruppsex"
USERS=("a" "p" "t")

echo "Ange startlösenordet för de nya användarna:"
read -sr PASSWORD
echo

groupadd $GROUP_NAME
mkdir -p /opt/$GROUP_NAME   
chown :$GROUP_NAME /opt/$GROUP_NAME
chmod 770 /opt/$GROUP_NAME
chmod g+s /opt/$GROUP_NAME

for user in "${USERS[@]}"; do
    useradd -m -G $GROUP_NAME -s /bin/bash "$user"
    echo "$user:$PASSWORD" | chpasswd
    chage -d 0 "$user"          
    echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/"$user"
    chmod 440 /etc/sudoers.d/"$user"
done

