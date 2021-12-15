#!/bin/sh

## Get variables from .env:
source ./.env

curl \
    -d "@data-test.txt" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -X POST $FHIR_SERVER_ENDPOINT/$RESOURCE_TYPE/_search
