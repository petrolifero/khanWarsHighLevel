#!/usr/bin/bash

pip install hpp2plantuml
apt install -y plantuml

for header in `find .. -type f -iname "*hpp"`
do
    includeOptions="$includeOptions -i $header"
done
hpp2plantuml $includeOptions -o actual.puml
plantuml actual.puml
