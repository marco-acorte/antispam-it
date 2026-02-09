# antispam-it

*Read this in other languages: [Italian](README.it.md)*

lists to spam a lot of rubbish ... hand-curated to fight spammers harassing poor mailboxes .it #spamrevenge

- Currently blocking **1518** domains. Last Update: **lun, 09 feb 2026 09:45:31 UTC**
- Currently blocking **202** emails.
- Currently blocking **42** IP addresses.


Strictly blocks advertisements networks, malwares, spams, statistics & trackers included in phishing/malware/spam/scam campaign harassing poor italian (domain.it) mailboxes. Manually verified, and is updated regularly.

the lists are:

- [antispam-it.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.txt) (DNSBL to be used as mail client filters or server filters)
- [antispam-it.hosts](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.hosts) (hosts file to be used as DNS resolver)
- [antispam-it.json](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.json) (json file to be used in your applications)
- [antispam-it.csv](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.csv) (csv file to be used in your applications)
- [ip-to-ban.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/ip-to-ban.txt) (ip list for firewall blocklist)
- [antispam-emails.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-emails.txt) (full emails addresses to block, also added to the spamassassin-blocklist.txt)
- [spamassassin-blocklist.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/spamassassin-blocklist.txt) (rules already prepared to be added to /etc/mail/spamassassin/local.cf)
- [outlook-blocklist.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/outlook-blocklist.txt) (rules already prepared to be added to MS Outlook)
- [antispam-pec-it.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-pec-it.txt) (full PEC emails addresses to block)
- [antispam-it.sieve](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.sieve) (sieve script to be used in your mail server)

## How to use

You can use the antispam-it project to block spam emails by adding bad domains to your email client or server.
more details in the [how to use](docs/how-to-use.md) document.

## 💖 Support development

### Do you like this project? Support it by donating

- Liberapay: [Donation](https://liberapay.com/acor3/donate)
- Buy me a coffee: [Donation](https://buymeacoffee.com/marcoacorte)
- PayPal: [Donation](https://www.paypal.com/donate?business=4RXVK5TKS3YT2&currency_code=EUR)

Antispam-it is open source software licensed under the [GNU GENERAL PUBLIC LICENSE](LICENSE) license.

The project is developed by [Marco Acorte](https://marcoacorte.com) and is available on [GitHub](https://github.com/marco-acorte/antispam-it).

The project and its contents are included also in these awesome projects:

- [Hagezi, DNS-Blocklists: For a better internet - keep the internet clean!](https://github.com/hagezi/dns-blocklists/)
- [NoTracking, Automatically updated, moderated and optimized lists for blocking ads, trackers, malware and other garbage](https://github.com/notracking/hosts-blocklists)

## Roadmap

You can read the detailed roadmap in [the roadmap document](docs/roadmap.md)
