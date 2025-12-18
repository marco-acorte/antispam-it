# Come usare Antispam IT

## Introduzione

Antispam IT è un progetto open source che mira a fornire un sistema di filtraggio delle email per:

- ridurre lo spam e le email indesiderate
- migliorare la sicurezza della posta elettronica
- proteggere la privacy degli utenti
- fornire un modo semplice per bloccare i domini di spam nei browser web e nei client di posta elettronica

Questo documento fornisce una guida su come utilizzare Antispam IT.

## Come utilizzare Antispam IT

Antispam IT può essere utilizzato sia a livello client che server per bloccare le email di spam aggiungendo domini indesiderati al tuo client o server di posta elettronica.
Puoi usare Antispam IT in diversi modi, a seconda delle tue esigenze e del tuo ambiente di lavoro.

### Utilizzo lato client

#### Come utilizzare in uBlock Origin per il browser web

Puoi utilizzare Antispam IT con uBlock Origin per bloccare i domini di spam nel tuo browser web.

Se hai gia installato una estenzione browser che supporta il protocollo "abp:" (ad esempio, uBlock Origin, Adblock Plus), puoi aggiungere la lista Antispam IT direttamente come filtro personalizzato cliccando su [Subscribe](abp:subscribe?location=https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.hosts&title=antispam-it) altrimenti segui questi passaggi:

1. Installa uBlock Origin dal negozio di estensioni del tuo browser.
2. Apri il dashboard di uBlock Origin facendo clic sull'icona dell'estensione e selezionando "Dashboard".
3. Vai alla scheda "Filtri di tere parti".
4. Scorri verso il basso fino alla sezione "Personalizzate".
5. Fai clic su "Importa" e incolla l'URL della lista Antispam IT (ad esempio, `https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.txt`).
6. Fai clic su "Salva i cambiamenti" per salvare la lista dei filtri.

#### Come utilizzare in Thunderbird

Puoi utilizzare Antispam IT per bloccare le email di spam in Thunderbird creando un filtro che controlla le email in arrivo rispetto alla lista dei domini indesiderati.
Secondo le [regole antispam da importare in Thunderbird](https://www.wilderssecurity.com/threads/antispam-rules-to-import-in-thunderbird.280688/#post-1738806), puoi impostare un filtro come segue:

1. Apri Thunderbird e vai al menu "Strumenti".
2. Seleziona "Filtri messaggi".
3. Fai clic su "Nuovo" per creare un nuovo filtro.
4. Dai un nome al filtro (ad esempio, "Blocca Spam").
5. Imposta il filtro per applicarsi durante il controllo della posta o l'esecuzione manuale.
6. Nella sezione "Match any of the following", aggiungi condizioni per verificare se il campo "Da" contiene uno dei domini indesiderati dalla lista Antispam IT.
7. Nella sezione "Perform these actions", imposta l'azione su "Elimina messaggio" o "Sposta in Posta indesiderata".
8. Salva il filtro.
9. Esegui il filtro sulla tua casella di posta per applicarlo alle email esistenti.

#### Come utilizzare in altri client di posta elettronica

Puoi utilizzare Antispam IT in altri client di posta elettronica seguendo passaggi simili per creare filtri o regole che controllano le email in arrivo rispetto alla lista dei domini indesiderati.

### Utilizzo lato server

#### Spamassassin

Puoi utilizzare Antispam IT con Spamassassin per bloccare le email di spam sul tuo server di posta elettronica.

Puoi utilizzare (o studiare) lo script bash fornito nel repository per automatizzare il processo di download e aggiornamento della lista Antispam IT per Spamassassin.

Puoi trovare lo script nel file `import-rules.sh` del repository.

Lo script scaricherà l'ultima lista Antispam IT e aggiornerà automaticamente la tua configurazione di Spamassassin.

#### Come utilizzare nei server di posta elettronica

Se gestisci un server di posta elettronica, puoi integrare la lista Antispam IT nel sistema di filtraggio dello spam del tuo server. Questo di solito comporta:

1. Scaricare l'ultima lista Antispam IT in un formato compatibile con il tuo server di posta elettronica (ad esempio, `hosts`, `json`, `csv` o `txt`).
2. Configurare le impostazioni di filtraggio dello spam del tuo server di posta elettronica per utilizzare la lista Antispam IT.
3. Impostare il server per bloccare o contrassegnare le email che corrispondono a uno dei domini indesiderati nella lista.

### Come contribuire

Se desideri contribuire al progetto Antispam IT, puoi:

- Segnalare nuovi domini di spam aprendo un issue nel repository GitHub.
- Creare pull request per aggiungere nuovi domini o migliorare la documentazione.
- Condividere il progetto con altri utenti per aumentare la consapevolezza e l'adozione.
- Fornire feedback e suggerimenti per migliorare il progetto.
- Sostenere lo sviluppo del progetto attraverso donazioni. Vedi la [sezione donazioni nel README](../README.it.md#-sostieni-lo-sviluppo).
