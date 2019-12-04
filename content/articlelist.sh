articlelist()
{
    for file in $(find ${ARTICLE_CONTENT_DIR}/[0-9]*/meta -type d '!' -name . -prune -o -type f);do
	. ${file}
	article_id=$(echo ${file} | sed s/.*\\\/\\\([0-9]*\\\)\\\/meta/\\\1/)
	eval articleid_${article_id}="'"${article_id}"'"
	IFS= eval articletitle_${article_id}="'"${TITLE}"'"
	IFS= eval articledescription_${article_id}="'"${DESCRIPTION}"'"
	IFS= eval articlelink_${article_id}="'/article/"${article_id}"'" # routerから取れるようにしたい
    done
    loopcount=${article_id}

    STATUS_CODE=OK
}

articlelist
