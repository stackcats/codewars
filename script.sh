#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <language> <extension>"
    echo "Example: $0 haskell hs"
    exit 1
fi

language="$1"
extension="$2"

if [[ -z "$language" || -z "$extension" ]]; then
    echo "Error: language and extension cannot be empty."
    echo "Usage: $0 <language> <extension>"
    exit 1
fi

echo "Language : $language"
echo "Extension: .$extension"
echo

mkdir -p -- "$language"

for i in {1..8}; do
    source_dir="${i}kyu"
    destination_dir="$language/$source_dir"

    if [[ ! -d "$source_dir" ]]; then
        echo "Skip: $source_dir does not exist"
        continue
    fi

    mkdir -p -- "$destination_dir"

    echo "Processing: $source_dir"

    found=false

    for file in "$source_dir"/*."$extension"; do

        if [[ ! -f "$file" ]]; then
            continue
        fi

        found=true

        filename="${file##*/}"

        destination="$destination_dir/$filename"

        if [[ -e "$destination" ]]; then
            echo "  Skip: $filename (already exists)"
            continue
        fi

        mv -- "$file" "$destination"

        echo "  Move: $filename"
    done

    if [[ "$found" == false ]]; then
        echo "  No .$extension files found"
    fi
done

echo
echo "Done."
