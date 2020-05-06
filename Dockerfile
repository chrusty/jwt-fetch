FROM alpine
RUN apk add curl jq

COPY entrypoint.sh /

ENV AUTH_USERNAME ''
ENV AUTH_PASSWORD ''
ENV LOGIN_URL 'https://some.address/v1/auth'
ENV POST_DATA '{}'
ENV JQ_QUERY '.users[0].token'
ENV TOKEN_FILE '/token.jwt'

CMD /entrypoint.sh