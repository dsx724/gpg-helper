#!/bin/bash

if [ -z "$1" -o -z "$2" -o -z "$3" ]; then
	echo "$0 FILE.gpg KEY_ID EXPIRATION" >&2
	exit 1
fi

mkdir -m 0700 GNUPGHOME
export GNUPGHOME=$PWD/GNUPGHOME
gpg --import $1
gpg --quick-set-expire $2 $3
gpg --export-options export-minimal --export $2
rm -rf $GNUPGHOME
