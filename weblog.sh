#!/bin/sh
LC_ALL=C

if [ -n "${DOCUMENT_URL}" ];then
    readonly ROOT_DIR=$(pwd)
else
    readonly ROOT_DIR=/htdocs/weblog
fi
#
readonly LIB_DIR=${ROOT_DIR}/lib
readonly SYS_DIR=${ROOT_DIR}/sys
readonly TEMPLATE_DIR=${ROOT_DIR}/template
readonly COMPONENT_DIR=${ROOT_DIR}/component
readonly CONTENT_DIR=${ROOT_DIR}/content
readonly ARTICLE_CONTENT_DIR=${CONTENT_DIR}/article
readonly TAG_CONTENT_DIR=${CONTENT_DIR}/tag
readonly PATH=${SYS_DIR}:/bin:/usr/bin
readonly MAIN_TEMPLATE=${TEMPLATE_DIR}/main.html
readonly CGI_ROOT="weblog.sh"

. lib-loader
. router
. render
load_library template

router

