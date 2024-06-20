#!/bin/bash

# generate json header
echo "{"

# generate json body
echo "\"domains\": ["
cat antispam-domains.txt | while read line

do
  echo "  {"
  echo "    \"domain\": \"$line\","
  echo "    \"description\": \"\","
  echo "    \"source\": \"\","
  echo "    \"category\": \"\","
  echo "    \"sub-category\": \"\","
  echo "    \"note\": \"\""
  echo "  },"
done

# remove last comma
sed -i '$ s/.$//' antispam-domains.txt

# generate json footer
echo "]"
echo "}"
