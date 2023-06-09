#!/bin/sh

#BOARD_DIR=$(dirname $0)

#cp ${BOARD_DIR}/sw-description ${BINARIES_DIR}
CONTAINER_VER="1.0"
PRODUCT_NAME="U54_OTA_file_update"

IMG_FILES="sw-description sw-description.sig simple_ota_hello.py update.sh"
openssl dgst -sha256 -sign swupdate-priv.pem sw-description > sw-description.sig
#pushd ${BINARIES_DIR}
for f in ${IMG_FILES} ; do
	echo ${f}
done | cpio -ovL -H crc > ${PRODUCT_NAME}_${CONTAINER_VER}.swu
#popd
