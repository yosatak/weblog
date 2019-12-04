tag(){
    STATUS_CODE="OK"
    if [ ! -f ${TAG_CONTENT_DIR}/${tag_id} ]; then
	STATUS_CODE="NotFound"; render HTML; exit 1
    fi

    . ${TAG_CONTENT_DIR}/${tag_id}

    tagcount='-1'
    for file in $(find ${ARTICLE_CONTENT_DIR}/[0-9]*/${tag_id} -type d '!' -name . -prune -o -type l);do
	article_id=$(echo ${file} | sed s/.*\\\/\\\([0-9]*\\\)\\\/${tag_id}/\\\1/)
	. ${ARTICLE_CONTENT_DIR}/${article_id}/meta
	eval articleid_${article_id}="'"${article_id}"'"
	IFS= eval articletitle_${article_id}="'"${TITLE}"'"
	IFS= eval articledescription_${article_id}="'"${DESCRIPTION}"'"
	IFS= eval articlelink_${article_id}="'/article/"${article_id}"'" # routerから取れるようにしたい
	tagcount=$( expr ${tagcount} + 1 )
    done

    if [ ${tagcount} = '-1' ] ;then
	STATUS_CODE="NotFound"; render HTML; exit 1
    fi


    pagetitle=${TITLE}'の記事一覧|無停止デプロイ'
}

tag
