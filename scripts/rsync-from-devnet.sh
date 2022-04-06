#!/bin/bash

MOUNTDIR=/mnt/Devnet_DOCS
SRCDIR="/mnt/Devnet_DOCS/@Shares/(1) root/(62) PROD_EXTERNAL_DEVNET_DOCS"
DESTDIR=/Devnet_DOCS
WEBDAV=https://ccie-folder.ccie.cisco.com/dav.php/



mount.davfs  -o noexec $WEBDAV $MOUNTDIR

LNDIR=~/temp/PROD_EXTERNAL_DEVNET_DOCS

mkdir -p ~/temp/
rm -f $LNDIR
ln -s "${SRCDIR}"  ${LNDIR}



rsync -av --progress ${LNDIR}/ $DESTDIR


umount $MOUNTDIR

