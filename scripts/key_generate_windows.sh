#!/bin/bash

if [ $# -ne 1 ]
then
    echo "No arguments supplied"
    echo "Usage: key_generate_windows.sh <alias>"
    exit 1
fi

alias=$1

# get hidden password
echo -n "Enter Password: "
read -s password
echo

echo -n "Confirm Password: "
read -s password_confirm
echo

if [ "$password" != "$password_confirm" ]
then
    echo "Password not match"
    exit 1
fi
# end - get hidden password

# start - Generate key
keytool -genkey -v -keystore "$(pwd)/../android/app/$alias.pfx" -storetype PKCS12 -keyalg RSA -keysize 2048 -validity 10000 -alias $alias -keypass $password -storepass $password
# end - Generate key