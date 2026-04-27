# Come usare import-ip-blocklists.sh

Questa guida spiega come usare lo script [import-ip-blocklists.sh](../import-ip-blocklists.sh) per scaricare una o piu liste IP pubbliche, estrarre IPv4/CIDR validi, deduplicare i risultati e usarli come blocklist firewall.

## Prerequisiti

- Bash
- Uno tra curl o wget
- Per applicare regole firewall: ipset e iptables
- Permessi root solo quando usi l'opzione --apply

## File utili gia presenti nel repository

- Script: [import-ip-blocklists.sh](../import-ip-blocklists.sh)
- Esempio sorgenti: [ip-to-ban-sources.txt](../ip-to-ban-sources.txt)
- Output predefinito: [ip-to-ban.txt](../ip-to-ban.txt)

## Uso base

Esegui con URL passate direttamente:

`./import-ip-blocklists.sh https://example.org/list1.txt https://example.org/list2.txt`

Esegui usando un file di sorgenti (una URL per riga):

`./import-ip-blocklists.sh --url-file ip-to-ban-sources.txt`

In entrambi i casi, lo script:

1. Scarica tutte le fonti
2. Estrae solo IPv4/CIDR validi
3. Deduplica le voci
4. Scrive il risultato in ip-to-ban.txt

## Opzioni principali

- --url-file FILE: legge le URL da file
- --output FILE: imposta il file di output
- --timeout SECONDS: timeout download per ogni URL
- --merge-existing: include anche le voci gia presenti nel file di output
- --set-name NAME: nome ipset da usare con --apply
- --apply: applica la blocklist su ipset e collega regola iptables INPUT DROP
- --help: mostra aiuto

## Esempi pratici

Output su file personalizzato:

`./import-ip-blocklists.sh --url-file ip-to-ban-sources.txt --output my-ip-blocklist.txt`

Merge con lista esistente + deduplica:

`./import-ip-blocklists.sh --url-file ip-to-ban-sources.txt --merge-existing --output ip-to-ban.txt`

Applicazione diretta al firewall (richiede root):

`sudo ./import-ip-blocklists.sh --url-file sources.txt --apply --set-name antispam_ext_block`

## Cosa fa --apply

Quando usi `--apply`, lo script:

1. Crea (se assente) il set ipset scelto
2. Svuota il set
3. Inserisce tutte le reti/IP estratte
4. Verifica se esiste la regola iptables su INPUT
5. Se manca, aggiunge: match-set <set-name> src -j DROP

## Verifica veloce dopo l'applicazione

Controlla contenuto set:

`sudo ipset list antispam_ext_block`

Controlla regola INPUT:

`sudo iptables -S INPUT | grep antispam_ext_block`

## Aggiornamento periodico con cron

Esempio aggiornamento ogni giorno alle 03:15 con applicazione automatica:

`15 3 * * * /bin/bash /percorso/assoluto/import-ip-blocklists.sh --url-file /percorso/assoluto/sources.txt --apply --set-name antispam_ext_block >> /var/log/import-ip-blocklists.log 2>&1`

## Note importanti

- Le fonti pubbliche possono contenere falsi positivi: valida sempre in ambiente di test.
- Se usi nftables, valuta una variante dedicata (iptables-nft o regole native nft).
- Controlla periodicamente policy/licenze delle sorgenti esterne.

## Risoluzione problemi

Errore: No URLs provided

- Passa almeno una URL oppure usa --url-file con file esistente.

Errore: --apply requires root privileges

- Esegui con sudo oppure senza --apply per sola generazione file.

Errore download di una sorgente

- Lo script segnala un warning e continua con le altre liste disponibili.

Errore: No valid IPv4/CIDR entries extracted

- Le fonti scaricate non contengono IPv4/CIDR in formato valido oppure sono vuote/non raggiungibili.
