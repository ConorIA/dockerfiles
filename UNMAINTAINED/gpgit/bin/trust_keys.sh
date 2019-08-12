#!/bin/bash

key=$1
key=$(echo $key | sed 's/\.pvt//;s/\.pub//')

echo "Trusting key ${key}"
sudo -u gpgit /usr/bin/gpg --homedir=/var/opt/gpgit/.gnupg --import /tmp/keys/${key}.pub
if [ -e /tmp/keys/${key}.pvt ]
then
  sudo -u gpgit /usr/bin/gpg --homedir=/var/opt/gpgit/.gnupg --import /tmp/keys/${key}.pvt
fi
echo "$(sudo -u gpgit /usr/bin/gpg --homedir=/var/opt/gpgit/.gnupg --list-keys --fingerprint | \
  grep ${key} -A 1 | tail -1 | tr -d '[:space:]' | awk 'BEGIN { FS = "=" } ; { print $2 }'):6:" | \
  sudo -u gpgit /usr/bin/gpg --homedir=/var/opt/gpgit/.gnupg --import-ownertrust
