#!/bin/bash

# according to https://github.com/schweikert/postgrey this is the correct way to update the whitelist
#
# Updating the whitelist
# 
# You can find at the following URL the latest whitelist that is included in the Postgrey distribution:
# 
# https://postgrey.schweikert.ch/pub/postgrey_whitelist_clients
#
# If you fetch this list automatically, please make sure that you don't do it too frequently (updating once a day is ok).
#
# 
# usage: import-postgrey-whitelist.sh <destination-file>
# 
# example: import-postgrey-whitelist.sh /etc/postfix/postgrey_whitelist_clients

rcfile="$1"
postgrey_whitelist_clients="https://postgrey.schweikert.ch/pub/postgrey_whitelist_clients"

wget -qO- "$postgrey_whitelist_clients" > "$rcfile"
 
 # The script is very simple, it just downloads the whitelist from the official website and saves it to the file specified as the first argument. 
 # The script is executed as follows: 
 # import-postgrey-whitelist.sh /etc/postfix/postgrey_whitelist_clients
 
 # The script is executed as a cron job every day at 3:00 AM. 
 # crontab -l
# 0 3 * * * /usr/local/bin/import-postgrey-whitelist.sh /etc/postfix/postgrey_whitelist_clients
 
 #reload postfix to apply the changes
# systemctl reload postfix
 

