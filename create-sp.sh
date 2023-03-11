#!/usr/bin/env bash
set -euxo pipefail

mkdir -p ~/.azdev

spname="azdevsp$(date '+%s')"

# create new sp
spjson=$(az ad sp create-for-rbac --create-cert --years 3 --name "$spname")

# move pem file to ~/.azdev
pempath=$(echo "$spjson" |sed -E 's!\\+!/!g' |jq -j '.fileWithCertAndPrivateKey')
mv "$pempath" ~/.azdev/sp.pem

# get object id of sp
while
    spid=$(az ad sp list --filter "displayName eq '$spname'"|jq -j '.[].id')
    [ -z "$spid" ]
do
    echo '.'
    sleep 1
done

# create ~/.azdev/env.sh
(
    printf "export AZURE_CLIENT_ID='%s'\n" $(jq -j '.appId' <<< "$spjson")
    printf "export AZURE_TENANT_ID='%s'\n" $(jq -j '.tenant' <<< "$spjson")
    printf "export AZURE_CLIENT_CERTIFICATE_PATH='%s'\n" '~/.azdev/sp.pem'
    printf "export AZDEV_SP_NAME='%s'\n" "$spname"
    printf "export AZDEV_SP_OBJECT_ID='%s'\n" "$spid"
) > ~/.azdev/env.sh
