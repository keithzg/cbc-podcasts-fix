#!/bin/bash

python 1st.py > first.list

cat first.list | \
while read LINE; do
        python 2nd.py $LINE >> second.list
done

grep xml second.list | grep podcasting | grep -v yahoo.com | grep -v "^itpc" | sort | uniq > final.list
