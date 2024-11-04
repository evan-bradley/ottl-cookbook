#!/bin/bash

directories=(code diagram)

docker build -t mermaid-cli-fonts .

for dir in ${directories}; do
    pushd ${dir}
    
    mkdir -p output

    files=$(find . -iname '*.mmd' -type f)
    rm -f output/*.png
    for file in $files; do
        docker run --rm -u $(id -u):$(id -g) -v $(pwd):/data mermaid-cli-fonts -c config.json -s 10 -i ${file} -o output/$(basename ${file}).png
    done

    popd
done