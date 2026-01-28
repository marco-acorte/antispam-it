#!/bin/bash

# calculate version based on current datetime .example: 2021.01.01.01.01.01
version=$(date +"%Y.%m.%d.%H.%M.%S")
# echo "Version: $version"

# generate header.txt
./generate-header.sh > header.txt

#generate antispam-it.txt as a combination of header.txt and antispam-domains.txt
cat header.txt antispam-domains.txt > antispam-it.txt

./generate-spamassasin-blocklist.sh > spamassassin-blocklist.txt
./generate-outlook-blocklist.sh > outlook-blocklist.txt

#generate antispam-it.hosts as elaborated version of antispam-it.txt
./generate-hosts.sh > antispam-it.hosts

#generate antispam-it.csv as elaborated version of antispam-it.txt
./generate-csv.sh > antispam-it.csv

#generate antispam-it.json as elaborated version of antispam-it.txt
./generate-json.sh > antispam-it.json

#generate antispam-it.sieve as elaborated version of antispam-domains.txt
./generate-sieve.sh

# commit and push to github all the changes
git add .
git commit -m "Update blocklists ver. $version"
git push
