#!/bin/bash

#  define var separator to split line and set it to empty
IFS=''

# generate json header
echo "{"

# generate json body
echo "\"domains\": ["
cat antispam-domains.txt | while read line

do
  echo "  $IFS{"
  echo "    \"domain\": \"$line\","
  echo "    \"description\": \"\","
  echo "    \"source\": \"\","
  echo "    \"category\": \"\","
  echo "    \"sub-category\": \"\","
  echo "    \"note\": \"\""
  echo "  }"
  IFS=','
done

# generate json footer
echo "]"
echo "}"
