#!/bin/bash

if [ -z $1 ]; then
	echo "$0 FILE.gpg" >&2
	exit 1
fi

mkdir -m 0700 GNUPGHOME
export GNUPGHOME=$PWD/GNUPGHOME
gpg --import $1
echo
echo "PUBLIC"
gpg --list-keys --with-subkey-fingerprint
echo "SECRET"
gpg --list-secret-keys --with-subkey-fingerprint
rm -rf GNUPGHOME
