#!/bin/sh

oktaurl = ${1}
OKTACLIENT = ${2}
OKTAKEY = ${3}
HOSTIP = ${4}

curl --location --request PUT $oktaurl'//api/v1/apps/'$OKTACLIENT \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--header 'Authorization: SSWS $OKTAKEY' \
--data-raw '{
    "name": "oidc_client",
    "label": "Node Weight Tracker",
    "credentials": {
        "oauthClient": {
            "autoKeyRotation": true,
            "client_id": "$OKTACLIENT",
            "token_endpoint_auth_method": "client_secret_basic"
        }
    },
    "settings": {
        "oauthClient": {
            "redirect_uris": [
                "http://$HOSTIP:8080/authorization-code/callback"
            ],
            "post_logout_redirect_uris": [
                "http://$HOSTIP:8080/logout"
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