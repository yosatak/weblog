article_detail(){
    STATUS_CODE="OK"
    if [ ! -d ${ARTICLE_CONTENT_DIR}/${article_id} ]; then
	STATUS_CODE="NotFound"
	exit 1
    fi
    
    if [ ! -f ${ARTICLE_CONTENT_DIR}/${article_id}/*.html ] ;then
	STATUS_CODE="NotFound"; render HTML; exit 
    fi

    if [ $(ls -t ${ARTICLE_CONTENT_DIR}/${article_id} | head -1) != "meta" ]; then
	if [ ! -f ${ARTICLE_CONTENT_DIR}/${article_id}/*.org ]; then
	    STATUS_CODE="InternalServerError"; render HTML; exit 
	    exit 1
	fi
	
	cat ${ARTICLE_CONTENT_DIR}/${article_id}/*.org |\
	    grep -e '#+*'  |\
	    sed s/\'/\'\\\\\'\'/g|\
	    sed s/^#\\\+\\\([A-Z]*\\\):\ *\\\(.*\\\)/\\\1=\'\\\2\'/g |\
	    grep -e 'TITLE' -e 'AUTHOR' -e 'DESCRIPTION' > ${ARTICLE_CONTENT_DIR}/${article_id}/meta
	if [ ! $? ]; then
	    STATUS_CODE="InternalServerError"; render HTML; exit 1
	fi
	
	echo LAST_MODIFIED\=\'$(date -u "+%a, %d %b %Y %H:%m:%S GMT")\' >> ${ARTICLE_CONTENT_DIR}/${article_id}/meta
	if [ ! $? ]; then
	    STATUS_CODE="InternalServerError"; render HTML; exit 1
	fi

    fi
    
    
    . ${ARTICLE_CONTENT_DIR}/${article_id}/meta
    
    article=$(cat ${ARTICLE_CONTENT_DIR}/${article_id}/*.html)
}

article_detail
