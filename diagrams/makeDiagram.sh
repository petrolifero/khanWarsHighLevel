#!/usr/bin/bash

pip install hpp2plantuml
for header in `find .. -type f -iname "*hpp"`
do
    includeOptions="$includeOptions -i $header"
done
hpp2plantuml $includeOptions -o actual.puml
