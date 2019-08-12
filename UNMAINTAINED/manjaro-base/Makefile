SHELL := /bin/bash 

.PHONY: all base build push

all: base build push

base:
	echo "Generating base image";\
	sudo pacman -Syyu --noconfirm;\
	cd scripts;\
	sudo ./mkimage-manjaro.sh;\
	cd ..

build:
	echo "build";\
	sudo docker build -t conoria/manjaro-base .

push:
	sudo docker push conoria/manjaro-base
