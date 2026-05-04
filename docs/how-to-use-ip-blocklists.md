# How to use import-ip-blocklists.sh

This guide explains how to use [import-ip-blocklists.sh](../import-ip-blocklists.sh) to download one or more public IP blocklists, extract valid IPv4/CIDR entries, deduplicate results, and use them as a firewall blocklist.

## Requirements

- Bash
- Either curl or wget
- To apply firewall rules: ipset and iptables
- Root privileges only when using --apply

## Useful files already in this repository

- Script: [import-ip-blocklists.sh](../import-ip-blocklists.sh)
- Single-source example: [ip-to-ban-sources.txt](../ip-to-ban-sources.txt)
- Default output: [ip-to-ban.txt](../ip-to-ban.txt)
- Default whitelist: [ip-to-ban-whitelist.txt](../ip-to-ban-whitelist.txt)

## Basic usage

Run with URLs passed directly:

```bash
./import-ip-blocklists.sh https://example.org/list1.txt https://example.org/list2.txt
```

Run using a source file (one URL per line):

```bash
./import-ip-blocklists.sh --url-file sources.txt
```

In both cases, the script:

1. Downloads all sources
2. Extracts only valid IPv4/CIDR entries
3. Deduplicates entries
4. Writes the result to ip-to-ban.txt

## Main options

- --url-file FILE: load URLs from file
- --output FILE: set output file path
- --timeout SECONDS: download timeout for each URL
- --whitelist FILE: exclude IPs/CIDRs listed in this file from the blocklist (one entry per line, # comments allowed)
- --merge-existing: include entries already present in output file
- --set-name NAME: ipset name used with --apply
- --apply: apply blocklist to ipset and add iptables INPUT DROP rule
- --help: show help

## Practical examples

Write to a custom output file:

```bash
./import-ip-blocklists.sh --url-file sources.txt --output my-ip-blocklist.txt
```

Merge with existing list and deduplicate:

```bash
./import-ip-blocklists.sh --url-file sources.txt --merge-existing --output ip-to-ban.txt
```

Apply directly to firewall (requires root):

```bash
sudo ./import-ip-blocklists.sh --url-file sources.txt --apply --set-name antispam_ext_block
```

Exclude trusted IPs using a whitelist:

```bash
./import-ip-blocklists.sh --url-file ip-to-ban-sources.txt --whitelist ip-to-ban-whitelist.txt
```

Combined whitelist and apply:

```bash
sudo ./import-ip-blocklists.sh --url-file ip-to-ban-sources.txt --whitelist ip-to-ban-whitelist.txt --apply
```

## Whitelist file format

The whitelist file uses the same format as the output: one entry per line, IPv4 or CIDR, with `#` comment support.

Example [ip-to-ban-whitelist.txt](../ip-to-ban-whitelist.txt):

```
# Trusted IPs that must never be blocked
203.0.113.5
198.51.100.0/24
```

The script removes all whitelisted entries from the blocklist before writing the output file. It logs the number of whitelist entries loaded and how many were actually removed.

## What --apply does

When you use --apply, the script:

1. Creates the selected ipset (if missing)
2. Flushes the set
3. Adds all extracted IPs/networks
4. Checks whether the INPUT iptables rule exists
5. If missing, adds: `match-set <set-name> src -j DROP`

## Quick checks after apply

Check ipset content:

```bash
sudo ipset list antispam_ext_block
```

Check INPUT rule:

```bash
sudo iptables -S INPUT | grep antispam_ext_block
```

## Scheduled update with cron

Example: update daily at 03:15 and apply automatically:

```cron
15 3 * * * /bin/bash /absolute/path/import-ip-blocklists.sh --url-file /absolute/path/sources.txt --apply --set-name antispam_ext_block >> /var/log/import-ip-blocklists.log 2>&1
```

## Important notes

- Public sources can contain false positives: validate in a test environment first.
- If your system uses nftables, consider an nft-native workflow.
- Review source policies/licenses periodically.

## Troubleshooting

Error: No URLs provided

- Pass at least one URL or use --url-file with an existing file.

Error: --apply requires root privileges

- Run with sudo, or run without --apply to only generate output.

Error while downloading one source

- The script prints a warning and continues with remaining sources.

Error: No valid IPv4/CIDR entries extracted

- Downloaded sources are empty/unreachable, or contain no valid IPv4/CIDR entries.

Error: Whitelist file not found

- The file passed to --whitelist does not exist. Check the path.
