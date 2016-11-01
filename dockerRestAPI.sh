#!/usr/bin/env bash


# user login : GET /v1/users ## default curl > -x performs GET requests
curl --raw -L --user chenglongzq:<password> https://index.docker.io/v1/users

# user register : POST /v1/users

# Update user : PUT /v1/users/<username>/

# Create user repo : PUT /v1/repositories/<NS>/<repo_name>/

curl --raw -L -X POST --post301 -H "Accept:application/json" -H "Content-Type: application/json" --data-ascii \"{"email":"<email>", "password":"<pass>", "username":"<username>"}\" https://index.docker.io/v1/users

# List user repository images

curl --raw -L --user <username>:<password> https://index.docker.io/v1/repositories/<ns>/<reponame>/images

# etc others requests, check at docker.documentations...