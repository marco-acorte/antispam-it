#!/bin/bash

# generate header.txt
./generate-header.sh > header.txt

#generate antispam-it.txt as a combination of header.txt and antispam-domains.txt
cat header.txt antispam-domains.txt > antispam-it.txt

./generate-spamassasin-blocklist.sh > spamassassin-blocklist.txt
./generate-outlook-blocklist.sh > outlook-blocklist.txt

# commit and push to github all the changes
git add .
git commit -m "Update blocklists"
git push
