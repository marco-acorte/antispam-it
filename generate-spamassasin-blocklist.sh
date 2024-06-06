#!/bin/bash

# importing domains and emails from antispam-domains.txt
while read p; do
  echo "blacklist_from *@$p"
  echo "blacklist_from *.$p"
done <antispam-domains.txt

# importing emails from antispam-emails.txt
while read p; do
  echo "blacklist_from $p"
done <antispam-emails.txt

# importing domains and emails from antispam-pec-it.txt
while read p; do
  echo "blacklist_from $p"
done <antispam-pec-it.txt