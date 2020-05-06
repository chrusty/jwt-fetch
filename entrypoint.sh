#/usr/bin/env sh
if [ ${AUTH_USERNAME} != '' ]
then
    /usr/bin/curl -sk -XPOST --user ${AUTH_USERNAME}:${AUTH_PASSWORD} ${LOGIN_URL} -d ${POST_DATA} |jq -r ${JQ_QUERY} >${TOKEN_FILE}
else
    /usr/bin/curl -sk -XPOST ${POST_URL} -d ${POST_DATA} |jq -r ${JQ_QUERY} >${TOKEN_FILE}
fi

cat ${TOKEN_FILE}
