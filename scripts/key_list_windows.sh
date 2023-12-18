#!/bin/bash

if [ $# -ne 1 ]
then
    echo "No arguments supplied"
    echo "Usage: key_generate_windows.sh <alias>"
    exit 1
fi

alias=$1

# get hidden password
echo -n "Enter Store Password: "
read -s password
echo
# end - get hidden password

# start - Generate key
keytool -list -v -keystore "$(pwd)/../android/app/$alias.pfx" -alias debug -storetype PKCS12 -storepass $password
# end - Generate key