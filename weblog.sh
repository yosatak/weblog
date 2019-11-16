#!/bin/sh
readonly ROOT_DIR=/htdocs/weblog
readonly LIB_DIR=${ROOT_DIR}/lib
readonly SYS_DIR=${ROOT_DIR}/sys
readonly TEMPLATE_DIR=${ROOT_DIR}/template
readonly COMPONENT_DIR=${ROOT_DIR}/component
readonly PATH=${SYS_DIR}:${LIB_DIR}:/bin:/usr/bin
readonly MAIN_TEMPLATE=${TEMPLATE_DIR}/main.html

. lib-loader
. router
. render

router

load_library template
PARAMS='aaa=aaa'
template_loader article.html | include_loader | content_loader ${PARAMS} | render OK HTML


