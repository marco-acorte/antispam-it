#!/bin/bash

# generate csv header
echo "domain,description,source,category,sub-category,note"

# generate csv body
cat antispam-domains.txt | while read line

do
  echo "$line, , , , , "
done