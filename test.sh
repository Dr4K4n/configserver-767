#!/bin/bash
input=encrypt-me
hash=$(curl -s -X POST --data-urlencode $input http://localhost:8888/encrypt)
output=$(curl -s -X POST --data-urlencode $hash http://localhost:8888/decrypt)
if [ "$input" = "$output" ]
then
    echo "Test OK"
else
    echo "Test FAILED: $input -> $output"
fi
