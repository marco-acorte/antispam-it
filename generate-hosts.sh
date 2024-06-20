#!/bin/bash

# generate hosts header
echo "# Hosts file for blocking spam domains"
cat header.txt

# generate hosts body
cat antispam-domains.txt | while read line

do
  echo "0.0.0.0    $line"
done

# generate hosts footer
echo "# ======================================================================================================"

