#!/bin/bash

# Script to generate a Sieve filter file to block emails from spam domains
# Based on the antispam-domains.txt file

INPUT_FILE="antispam-domains.txt"
OUTPUT_FILE="antispam-it.sieve"

echo "Generating Sieve filter file from $INPUT_FILE..."

# Creates the Sieve file header
cat > "$OUTPUT_FILE" << 'EOF'
# Antispam IT - Sieve Filter
# https://github.com/ac3/antispam-it
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
while IFS= read -r domain || [ -n "$domain" ]; do
    # Skips empty lines and comments
    [[ -z "$domain" || "$domain" =~ ^[[:space:]]*# ]] && continue
    
    # Removes whitespace
    domain=$(echo "$domain" | xargs)
    
    # Adds a comma after the first entry
    if [ "$first" = true ]; then
        echo "    envelope :domain :is \"from\" \"$domain\"" >> "$OUTPUT_FILE"
        first=false
    else
        echo "    ,envelope :domain :is \"from\" \"$domain\"" >> "$OUTPUT_FILE"
    fi
done < "$INPUT_FILE"

# Closes the Sieve file
cat >> "$OUTPUT_FILE" << 'EOF'
) {
    discard;
    stop;
}
EOF

# Counts the processed domains
DOMAIN_COUNT=$(grep -c "envelope :domain" "$OUTPUT_FILE")

echo "✓ Sieve file generated: $OUTPUT_FILE"
echo "✓ Domains processed: $DOMAIN_COUNT"
echo ""
echo "To install the filter:"
echo "1. Copy the file $OUTPUT_FILE to your mail server"
echo "2. Place it in the appropriate directory (e.g., ~/.dovecot.sieve or /etc/dovecot/sieve/)"
echo "3. Compile the filter if necessary: sievec $OUTPUT_FILE"
echo "4. Restart the mail service if required"