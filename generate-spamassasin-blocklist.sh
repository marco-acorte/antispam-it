#!/bin/bash

while read p; do
  echo "blacklist_from *@$p"
  echo "blacklist_from *.$p"
done <antispam-domains.txt

while read p; do
  echo "blacklist_from $p"
done <antispam-emails.txt