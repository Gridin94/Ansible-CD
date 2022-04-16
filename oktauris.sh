#!/bin/sh

# OKTAURL = $1
# OKTACLIENT = $2
# OKTAKEY = $3
# HOSTIP = $4

curl --location --request PUT $1'//api/v1/apps/'$2 \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--header 'Authorization: SSWS '$3 \
--data-raw '{
    "name": "oidc_client",
    "label": "Node Weight Tracker",
    "credentials": {
        "oauthClient": {
            "autoKeyRotation": true,
            "client_id": '"$2"',
            "token_endpoint_auth_method": "client_secret_basic"
        }
    },
    "settings": {
        "oauthClient": {
            "redirect_uris": [
                "http://'$4':8080/authorization-code/callback"
            ],
            "post_logout_redirect_uris": [
                "http://'$4':8080/logout"
            ],
            "response_types": [
                "code"
            ],
            "application_type": "web",
            "consent_method": "REQUIRED",
            "issuer_mode": "DYNAMIC"
        }
    }
}'