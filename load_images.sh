#!/bin/bash 

## this simple script checks if you have docker images stored as tar archives
## if so - it will load it from there, if not - it will pull and save it there
## useful for circle images caching: 
##    https://circleci.com/docs/docker#caching-docker-layers

cache_dir=~/cache_docker_images/
mkdir -p $cache_dir
for image in `cat docker-compose.yml | grep 'image:' | grep -o ' [^ ]*$'`; do
  filename=$( echo "$image" | sed -r 's/\//_/g' )

  image_path="$cache_dir""$filename"".tar"

  if [[ -e $image_path ]]; then 
   echo "Image $image exists in $image_path, loading..."
    docker load -i $image_path 
  else 
    echo "Image $image not found, pulling..."
    docker pull $image
    echo "saving $image > $image_path"
    docker save $image > $image_path
  fi

done
