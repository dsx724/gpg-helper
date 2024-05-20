#!/bin/bash

if [ -z "$1" -o -z "$2" ]; then
	echo "$0 FILE.gpg KEY_ID" >&2
	exit 1
fi

mkdir -m 0700 GNUPGHOME
export GNUPGHOME=$PWD/GNUPGHOME
gpg --import $1
gpg --export-options export-minimal --export-secret-subkeys $2!
rm -rf $GNUPGHOME
