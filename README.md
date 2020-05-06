jwt-fetch
=========
Fetch a JWT inside a container


Why?
---
This is intended to be used as an init-container for Kubernetes deployments. It will fetch a JWT (POST) from an authentication API, print it out, and write it to a file. You can intercept this file with a volume mount for re-use further down the line.


### Examples
Options are provided as env-vars:
- `AUTH_USERNAME`: Plain auth username (default '' means use POST_DATA instead)
- `AUTH_PASSWORD`: Plain auth password (default '' means use POST_DATA instead)
- `LOGIN_URL`: URL for the login endpoint (default 'https://some.address/v1/auth')
- `POST_DATA`: JSON request body (default '{}')
- `JQ_QUERY`: JQ query to pluck your token from the response (default '.users[0].token')
- `TOKEN_FILE`: Write the token to this file (default '/token.jwt')


#### Login with HTTP auth
```sh
docker run \
    --rm \
    -it \
    -e AUTH_USERNAME=prawn \
    -e AUTH_PASSWORD="ajshdjahsdasd" \
    -e LOGIN_URL="https://auth.cruft.com/v1/login" \
    prawnprawn/jwt-fetch
```

#### Login with POST data
```sh
docker run \
    --rm \
    -it \
    -e POST_DATA='{"user": "prawn", "password":"ajshdjahsdasd"}' \
    -e LOGIN_URL="https://auth.cruft.com/v1/login" \
    prawnprawn/jwt-fetch
```

#### Grab the token from a different part of the response object
```sh
docker run \
    --rm \
    -it \
    -e AUTH_USERNAME=prawn \
    -e AUTH_PASSWORD="ajshdjahsdasd" \
    -e LOGIN_URL="https://auth.cruft.com/v1/login" \
    -e JQ_QUERY='.token' \
    prawnprawn/jwt-fetch
```