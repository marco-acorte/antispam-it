#!/bin/bash

# generate hosts header
echo "# Hosts file for blocking spam domains"
echo "#"
echo "# This hosts file is a combination of antispam-it.txt and the original hosts file from StevenBlack/hosts."
echo "#"
echo "# Last Update: $(date -u)"
echo "#"
echo "# Project website: https://github.com/marco-acorte/antispam-it/ "
echo "#"
echo "# Support the project with a donation: https://www.buymeacoffee.com/marcoacorte"
echo "#"
echo "# This work is licensed under a GNU General Public License v3.0."
echo "# ======================================================================================================"
echo "#"

# generate hosts body
cat antispam-domains.txt | while read line

do
  echo "0.0.0.0    $line"
done

# generate hosts footer
echo "# ======================================================================================================"

