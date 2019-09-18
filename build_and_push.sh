#!/usr/bin/env bash

if [[ "$1" == "-h" ]]; then
    echo "Usage: "
    echo "  ./build_and_push.sh <tag>"
    exit 0
fi

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters, use -h to see a help message."
    exit 1
fi

hash=$(docker build . | grep -i 'Successfully built' | cut -d' '  -f 3)
echo "Built new image with hash: $hash"
echo "Tagging $hash with $1..."
docker tag "$hash" gemvision/graalvm-native-image:"$1"
echo "Tagging $hash with latest..."
docker tag "$hash" gemvision/graalvm-native-image:"latest"
echo "Pushing to docker hub..."
docker push gemvision/graalvm-native-image
