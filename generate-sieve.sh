#!/bin/bash

# Script to generate a Sieve filter file to block emails from spam domains
# Based on the antispam-domains.txt file

INPUT_FILE="antispam-domains.txt"
OUTPUT_FILE="antispam-it.sieve"

# Creates the Sieve file header prependeding before with header.txt file
cat header.txt
cat << 'EOF'
# Antispam IT - Sieve Filter
# 
# Automatically blocks emails from Italian spam domains
# 
# To use this filter, upload it to your mail server that supports Sieve
# (e.g., Dovecot, Cyrus IMAP, etc.)

require ["envelope", "fileinto", "reject"];

# Blocks emails from spam domains
if anyof (
EOF

# Reads the antispam-domains.txt file and generates Sieve rules
first=true

cat antispam-domains.txt | while read line

do
    # Skips empty lines and comments
    [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue   
    # Adds a comma after the first entry
    if [ "$first" = true ]; then
        echo "    envelope :domain :is \"from\" \"$line\"" 
        first=false
    else
        echo "    ,envelope :domain :is \"from\" \"$line\""
    fi
done

# Closes the Sieve file
cat << 'EOF'
) {
    discard;
    stop;
}
EOF