SHELL := /bin/bash 

.PHONY: all base build push

all: base build push

base:
	echo "Generating base image";\
	sudo pacman -Syyu --noconfirm;\
	cd scripts;\
	sudo ./mkimage-arch.sh;\
	cd ..

build:
	echo "build";\
	sudo docker build -t conoria/pkgbuilder:arch .

push:
	sudo docker push conoria/pkgbuilder:arch
