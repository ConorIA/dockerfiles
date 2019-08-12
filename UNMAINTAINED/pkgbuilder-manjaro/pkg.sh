#!/bin/bash

export EDITOR=/usr/bin/vi

if [ "$1" == '--help' ] || [ "$1" == '-h' ]; then
  echo "Navigate to the folder containing your makefile and execute:"
  echo "docker run --rm -it -v \"\$(pwd):/src\" conoria/pkgbuilder:manjaro"
  exit 1
fi

echo "Updating base"
pacman -Sy --noprogressbar --noconfirm
pacman -S --noprogressbar --noconfirm archlinux-keyring manjaro-keyring
pacman -Su --noprogressbar --noconfirm

echo "Cleaning up the package folder"
rm -rf src pkg *.pkg.tar.xz

echo "Installing dependencies and building package"
read -t 3 -p "Run interactively (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        promptresp=""
    ;;
    * )
        echo "Running without prompts. If you encounter errors, try interactive mode"
	promptresp="y"
    ;;
esac
deps=$(awk '/depends/{a=1} a; /)/{a=0}' PKGBUILD | sed -n "/optdepends/q;p" | sed "s/^[^=]*=(//;s/)//g;s/'//g" | tr '\n' ' ')

if [ "$promptresp" = "y" ]; then
expect <<EOF
	set send_slow {1 .1}
	proc send {ignore arg} {
		sleep .1
		exp_send -s -- \$arg
	}
	set timeout 120

	spawn sudo -u maker pacaur -S --needed $deps
	expect {
		-exact " are in conflict. Remove " { send -- "y\r"; exp_continue }
                -exact "Enter a number " { send -- "\r"; exp_continue }
		-exact "Enter a selection " { send -- "\r"; exp_continue }
		-exact "installation? \[Y/n\]" { send -- "y\r"; exp_continue }
	}
EOF

else
  sudo -u maker pacaur -S --needed $deps
fi
sudo -u maker makepkg --cleanbuild --clean --force

echo "Checking package with namcap"
result=$(find *.pkg.tar.xz)
namcap $result

echo "Testing if package can be installed"
yes | pacman -U $result
