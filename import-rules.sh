#!/bin/bash

# usage: import-rules.sh <destination-file> <rules-file>
# 
# example: import-rules.sh /etc/mail/spamassassin/local.cf /etc/mail/spamassassin/spamassassin-blocklist.txt

rcfile="$1"
snippet="$2"

var=$(<"$snippet")
if grep -q "START-ANTISPAM-IT" "$rcfile" ;then
   awk -v v="$var" '/START-ANTISPAM-IT/ {
     print $0
     print v
     f=1
   }f &&!/END-ANTISPAM-IT/{next}/END-ANTISPAM-IT/{f=0}!f' "$rcfile" >t && mv t "$rcfile"
else
   echo "#START-ANTISPAM-IT" >> "$rcfile"
   echo "$var" >> "$rcfile"
   echo "#END-ANTISPAM-IT" >> "$rcfile"
fi
