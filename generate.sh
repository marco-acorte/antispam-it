#!/bin/bash

# generate header.txt
./generate-header.sh > header.txt

./generate-spamassasin-blocklist.sh > spamassassin-blocklist.txt
./generate-outlook-blocklist.sh > outlook-blocklist.txt