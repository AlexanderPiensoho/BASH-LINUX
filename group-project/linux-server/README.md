# Instructions

copy and paste these commands in your terminal:
```sh
cd ~
git clone https://git.chas-lab.dev/grupp-sex/linux-server.git linux-server
cd linux-server
sudo ./sys-config.sh
```

## Shellcheck instructions
```sh
sudo apt install shellcheck
```
```sh
shellcheck -x <filename>
```

## Use netcat
```sh
nc localhost 5555
```

## Check netcat history
```sh
cat /var/log/socket-listener.log
```