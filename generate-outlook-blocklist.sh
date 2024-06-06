#!/bin/bash

# importing domains and emails from antispam-domains.txt
while read p; do
  echo "$p"
done <antispam-domains.txt

# importing domains and emails from antispam-emails.txt
while read p; do
  echo "$p"
done <antispam-emails.txt

# importing domains and emails from antispam-pec-it.txt
while read p; do
  echo "$p"
done <antispam-pec-it.txt