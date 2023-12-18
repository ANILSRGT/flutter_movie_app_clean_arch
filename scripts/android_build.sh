#!/bin/bash

if [ $# -ne 3 || $# -ne 4 ]
then
    echo "No arguments supplied"
    echo "Usage: android_build.sh <version> <build_number> <bundle|apk> {file_name}"
    exit 1
fi

if [ $3 != "bundle" ] && [ $3 != "apk" ]
then
    echo "Invalid argument"
    echo "Usage: android_build.sh <version> <build_number> <bundle|apk> {file_name}"
    exit 1
fi


# start - Update version in pubspec.yaml
flutter clean
file_name="../pubspec.yaml"
find_string="version:"
new_string="version: $1+$2"
find_line=$(grep -n "$find_string" "$file_name" | cut -d ":" -f 1)
sed -i "${find_line}s/.*/$new_string/" "$file_name"
flutter pub get
# end - Update version in pubspec.yaml


if [ $3 == "bundle" ]
then
    flutter build appbundle --build-name=$1 --build-number=$2
elif [ $3 == "apk" ]
then
    flutter build apk --build-name=$1 --build-number=$2
fi

new_string=""
if [ $# -eq 4 ]
then
    new_string=$4"_"v$1"_"$2
else
    file_name="../pubspec.yaml"
    find_string="name:"
    new_string="$(grep "$find_string" "$file_name" | cut -d " " -f 2)"
    new_string=$new_string"_"v$1"_"$2
fi

if [ $3 == "bundle" ]
then
    mv "$(pwd)/../build/app/outputs/bundle/release/app-release.aab" "$(pwd)/../build/app/outputs/bundle/release/$new_string.aab"
elif [ $3 == "apk" ]
then
    mv "$(pwd)/../build/app/outputs/flutter-apk/app-release.apk" "$(pwd)/../build/app/outputs/flutter-apk/$new_string.apk"
fi

# Open the folder where the file is located
if [ $3 == "bundle" ]
then
    start $(pwd)/../build/app/outputs/bundle/release
elif [ $3 == "apk" ]
then
    start $(pwd)/../build/app/outputs/flutter-apk/
fi

exit 0