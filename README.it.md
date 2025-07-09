# antispam-it

*Read this in other languages: [English](README.md)*

liste per mandare in spam un sacco di zozzeria... curata a mano per combattere gli spammer che tartassano povere mailbox .it #spamrevenge

Attualmente blocca 1426 domini. Ultimo aggiornamento: mer, 09 lug 2025 16:07:36 UTC

Blocca rigorosamente i domini usati dalle reti pubblicitarie, i malware, gli spam, gli scam, le statistiche e i tracker inclusi nelle campagne di phishing/malware/spam che molestano le povere caselle di posta italiane (domain.it).

Verificato manualmente e aggiornato regolarmente.

le liste sono:

- [antispam-it.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.txt) (DNSBL da usare come filtri per client di posta o per filtri server)
- [antispam-it.hosts](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.hosts) (file hosts da usare come risolutore DNS)
- [antispam-it.json](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.json) (file json da usare nelle tue applicazioni)
- [antispam-it.csv](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.csv) (file csv da usare nelle tue applicazioni)
- [ip-to-ban.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/ip-to-ban.txt) (lista ip per firewall blocklist)
- [antispam-emails.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-emails.txt) (indirizzi emails completi da bloccare, vengono aggiunti anche in spamassassin-blocklist.txt)
- [spamassassin-blocklist.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/spamassassin-blocklist.txt) (regole già preparate per essere aggiunte a /etc/mail/spamassassin/local.cf)
- [outlook-blocklist.txt](https://raw.githubusercontent.com/marco-acorte/antispam-it/main/outlook-blocklist.txt) (regole già pronte per essere aggiunte a MS Outlook)

## 💖 Sostieni lo sviluppo

### Ti piace questo progetto? Sostienilo donando

- Liberapay: [Donazione](https://liberapay.com/acor3/donate)
- Buy me a coffee: [Donazione](https://buymeacoffee.com/marcoacorte)
- PayPal: [Donazione](https://www.paypal.com/donate?business=4RXVK5TKS3YT2&currency_code=EUR)

Antispam-it è un software open source concesso in licenza con licenza  [GNU GENERAL PUBLIC LICENSE](LICENSE).

Il progetto è sviluppato da [Marco Acorte](https://marcoacorte.com) ed è disponibile su [GitHub](https://github.com/marco-acorte/antispam-it).

Il progetto e i suoi contenuti sono inclusi anche in questi fantastici progetti:

- [Hagezi, DNS-Blocklists: For a better internet - keep the internet clean!](https://github.com/hagezi/dns-blocklists/)
- [NoTracking, Automatically updated, moderated and optimized lists for blocking ads, trackers, malware and other garbage](https://github.com/notracking/hosts-blocklists)

## Roadmap

Puoi leggere la roadmap dettagliata nel [documento roadmap](docs/roadmap.md)
