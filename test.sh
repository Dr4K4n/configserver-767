#!/bin/bash
mvn clean package
java -jar target/configserver-0.0.1-SNAPSHOT.jar &
sleep 8
input=encrypt-me
hash=$(curl -s -X POST --data-urlencode $input http://localhost:8888/encrypt)
output=$(curl -s -X POST --data-urlencode $hash http://localhost:8888/decrypt)
if [ "$input" = "$output" ]
then
    echo "Test OK"
else
    echo "Test FAILED: $input -> $hash -> $output"
fi
