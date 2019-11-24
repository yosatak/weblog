#!/bin/sh

if [ -v $DOCUMENT_URL ];then
    readonly ROOT_DIR=$(pwd)
else
    readonly ROOT_DIR=/htdocs/weblog
fi
#
readonly LIB_DIR=${ROOT_DIR}/lib
readonly SYS_DIR=${ROOT_DIR}/sys
readonly TEMPLATE_DIR=${ROOT_DIR}/template
readonly COMPONENT_DIR=${ROOT_DIR}/component
readonly PATH=${SYS_DIR}:${LIB_DIR}:/bin:/usr/bin
readonly MAIN_TEMPLATE=${TEMPLATE_DIR}/main.html
readonly CGI_ROOT="/weblog.sh/"
. lib-loader
#. router
. render

# router

load_library template
load_library virtual-associative-array
PARAMS='aaa=aaa'
template_loader article.html | include_loader | content_loader ${PARAMS} | render OK HTML

echo $DOCUMENT_URI
