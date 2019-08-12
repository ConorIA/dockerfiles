#!/bin/sh

chown -R maker:abuild /home/maker/packages
chown -R maker:abuild /keys

apk update
apk add gmp libffi zlib pcre cmark@testing icu ghc cabal linux-headers musl-dev gmp-dev zlib-dev

echo "Building pandoc"
cd pandoc
echo "Cleaning up the package folder"
rm -rf src pkg

sudo -u maker abuild checksum
sudo -u maker abuild verify
sudo -u maker abuild

echo "Building pandoc-citeproc"
cd ../pandoc-citeproc
echo "Cleaning up the package folder"
rm -rf src pkg

sudo -u maker abuild checksum
sudo -u maker abuild verify
sudo -u maker abuild -d

sudo -u maker abuild index

