#!/bin/bash

if [ $# -ne 2 ] && [ $# -ne 0 ]
then
    echo "Usage 2: sh lang.sh <source-dir> <output-dir>"
    echo "Usage with default variables: sh lang.sh"
    exit 1
fi

if [ $# -eq 2 ]
then
    flutter pub run easy_localization:generate -O $2 -f keys -o locale_keys.g.dart --source-dir $1
    exit 1
fi

flutter pub run easy_localization:generate -O lib/app/init/localization -f keys -o locale_keys.g.dart --source-dir assets/translations