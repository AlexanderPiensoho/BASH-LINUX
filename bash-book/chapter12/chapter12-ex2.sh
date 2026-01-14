#!/usr/bin/env bash

current_dir=$(pwd)
echo "Installing crawl manually..."
echo "Downloading repo..."

git clone https://github.com/crawl/crawl.git

cd crawl

echo "Installing dependecies..."
git submodule update --init

echo "installing make and dependencies"
sudo apt update && sudo apt install make -y
sudo apt install build-essential libncursesw5-dev bison flex liblua5.4-dev \
libsqlite3-dev libz-dev pkg-config python3-yaml binutils-gold python-is-python3

sudo apt install libsdl2-image-dev libsdl2-mixer-dev libsdl2-dev \
libfreetype6-dev libpng-dev fonts-dejavu-core \
advancecomp pngcrush

echo "Building DCSS..."
cd crawl-ref/source

set -m

make -j4 TILES=y &

PID=$!

trap "echo EY! STOP THAT" SIGINT SIGTERM

while kill -0 $PID; do
	wait $PID
done

trap - SIGINT SIGTERM
set +m
