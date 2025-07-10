# How to use antispam-it

Use the antispam-it project to block spam emails by adding bad domains to your email client or server.

## client-side usage

### How to use in uBlock Origin

You can use the antispam-it project with uBlock Origin to block spam domains your web browser. Follow these steps:

1. Install uBlock Origin from the browser's extension store.
2. Open uBlock Origin's dashboard by clicking on the extension icon and selecting "Dashboard".
3. Go to the "Filter Lists" tab.
4. Scroll down to the "Custom" section.
5. Click on "Import" and paste the URL of the antispam-it list (e.g., `https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.txt`).
6. Click "Apply changes" to save the filter list.

If you already have installed a browser extension supporting the "abp:" protocol (e.g. uBlock Origin, Adblock Plus), you can add the antispam-it list directly as a custom filter by clicking on [Subscribe](abp:subscribe?location=https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.txt&title=antispam-it).

### How to use in Thunderbird

You can use the antispam-it project to block spam emails in Thunderbird by creating a filter that checks incoming emails against the list of bad domains.

According to the [antispam rules to import in Thunderbird](https://www.wilderssecurity.com/threads/antispam-rules-to-import-in-thunderbird.280688/#post-1738806), you can set up a filter as follows:

1. Open Thunderbird and go to the "Tools" menu.
2. Select "Message Filters".
3. Click on "New" to create a new filter.
4. Name the filter (e.g., "Block Spam").
5. Set the filter to apply when checking mail or manually running it.
6. In the "Match any of the following" section, add conditions to check if the "From" field contains any of the bad domains from the antispam-it list.
7. In the "Perform these actions" section, set the action to "Delete Message" or "Move to Junk".
8. Save the filter.
9. Run the filter on your inbox to apply it to existing emails.

### How to use in other email clients

You can use the antispam-it project in other email clients by following similar steps to create filters or rules that check incoming emails against the list of bad domains.

## Server-side usage

## Spamassassin

You can use the antispam-it project with Spamassassin to block spam emails on your email server.

You can use (or study) the bash script provided in the repository to automate the process of downloading and updating the antispam-it list for Spamassassin.

You can find the script in the `import-rules.sh` file of the repository.

The script will download the latest antispam-it list and update your Spamassassin configuration automatically.

### How to use in email servers

If you manage an email server, you can integrate the antispam-it list into your server's spam filtering system. This typically involves:

1. Downloading the latest antispam-it list in a format compatible with your email server (e.g., `hosts`, `json`, `csv`, or `txt`).
2. Configuring your email server's spam filtering settings to use the antispam-it list.
3. Setting the server to block or mark emails that match any of the bad domains in the list.

## How to contribute

If you want to contribute to the antispam-it project, you can:

1. Report new spam domains by creating an issue on the project's GitHub repository.
2. Submit a pull request with your changes to the list.
3. Share your experience or improvements in the project's documentation.
