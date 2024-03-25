#!/bin/bash

while read p; do
  echo "$p"
done <antispam-domains.txt

while read p; do
  echo "$p"
done <antispam-emails.txt