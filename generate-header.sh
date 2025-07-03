#!/bin/bash

# generate header.txt

# 
# Antispam-it | The Blocklist to trap a lot of rubbish ... hand-curated to fight spammers harassing poor mailboxes .it #spamrevenge
# Strictly blocks advertisements networks, malwares, spams, statistics & trackers included in phishing/malware/spam 
# campaign harassing poor italian (domain.it) mailboxes. Manually verified, and is updated regularly.
# 
# Last Update: Thu, 21 Mar 2024 05:46:20 UTC
# 
# Project website: https://github.com/marco-acorte/antispam-it/ 
# Support the project with a donation:: https://www.buymeacoffee.com/marcoacorte 
# 
# This work is licensed under a GNU General Public License v3.0. 
# ======================================================================================================

# count domains in antispam-domains.txt
domain_count=$(wc -l < antispam-domains.txt | tr -d ' ')
# generate header.txt with the total domains and last update date in "YYMMDDThhmmss+hhmm"" format
last_update_date=$(date +"%y%m%dT%H%M%S%z")
echo "# ======================================================================================================" > header.txt
echo "# Antispam-it | The Blocklist to trap a lot of rubbish ... hand-curated to fight spammers harassing poor mailboxes .it #spamrevenge" >> header.txt
echo "# Strictly blocks advertisements networks, malwares, spams, statistics & trackers included in phishing/malware/spam " >> header.txt
echo "# campaign harassing poor italian (domain.it) mailboxes. Manually verified, and is updated regularly." >> header.txt
echo "# " >> header.txt
echo "# Total Domains: $domain_count" >> header.txt
echo "# " >> header.txt
echo "# Last Update: $last_update_date" >> header.txt
echo "# " >> header.txt
echo "# Project website: https://github.com/marco-acorte/antispam-it/ " >> header.txt
echo "# " >> header.txt
echo "# Support the project with a donation: https://www.buymeacoffee.com/marcoacorte" >> header.txt
echo "# " >> header.txt
echo "# This work is licensed under a GNU General Public License v3.0." >> header.txt
echo "# ======================================================================================================" >> header.txt
echo "" >> header.txt

# updates the domain count in README.md and README.it.md
sed -i "s/Attualmente blocca [0-9]\+ domini./Attualmente blocca $domain_count domini./" README.it.md
sed -i "s/Currently blocking [0-9]\+ domains./Currently blocking $domain_count domains./" README.md

# updates the last update date in README.md and README.it.md
sed -i "s/Ultimo aggiornamento: [A-Za-z]\+, [0-9]\+ [A-Za-z]\+ [0-9]\+ [0-9]\+:[0-9]\+:[0-9]\+ UTC/Ultimo aggiornamento: $(date +"%a, %d %b %Y %H:%M:%S UTC")/" README.it.md
sed -i "s/Last Update: [A-Za-z]\+, [0-9]\+ [A-Za-z]\+ [0-9]\+ [0-9]\+:[0-9]\+:[0-9]\+ UTC/Last Update: $(date +"%a, %d %b %Y %H:%M:%S UTC")/" README.md
