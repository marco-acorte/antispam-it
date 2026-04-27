#!/bin/bash

# calculate version based on current datetime .example: 2021.01.01.01.01.01
version=$(date +"%Y.%m.%d.%H.%M.%S")
# echo "Version: $version"

# generate header.txt
./generate-header.sh > header.txt

#generate antispam-it.txt as a combination of header.txt and antispam-domains.txt
echo "[INFO] Generating antispam-it.txt..." >&2
cat header.txt antispam-domains.txt > antispam-it.txt

echo "[INFO] Generating spamassassin blocklist..." >&2
./generate-spamassasin-blocklist.sh > spamassassin-blocklist.txt

echo "[INFO] Generating outlook blocklist..." >&2
./generate-outlook-blocklist.sh > outlook-blocklist.txt

#generate antispam-it.hosts as elaborated version of antispam-it.txt
echo "[INFO] Generating antispam-it.hosts..." >&2
./generate-hosts.sh > antispam-it.hosts

#generate antispam-it.csv as elaborated version of antispam-it.txt
echo "[INFO] Generating antispam-it.csv..." >&2
./generate-csv.sh > antispam-it.csv

#generate antispam-it.json as elaborated version of antispam-it.txt
echo "[INFO] Generating antispam-it.json..." >&2
./generate-json.sh > antispam-it.json

#generate antispam-it.sieve as elaborated version of antispam-domains.txt
echo "[INFO] Generating antispam-it.sieve..." >&2
./generate-sieve.sh > antispam-it.sieve

# generate ip-to-ban.txt as elaborated version of ip-to-ban-sources.txt
./import-ip-blocklists.sh --url-file ip-to-ban-sources.txt --output ip-to-ban.txt --merge-existing

# commit and push to github all the changes
git add .
git commit -m "Update blocklists ver. $version"
git push
