---
title: "Use Fluidkeys to extend your key in GnuPG"
weight: 4
---

# Use Fluidkeys to extend your key in GnuPG

Fluidkeys can automatically extend your key expiry and fix issues with keys you've made in GnuPG.

<div class="callout callout--info"><p>Fluidkeys simplifies using PGP in a team. You can send end-to-end encrypted secrets, use <code>pass</code> to store team secrets. Public keys are automatically distributed and trusted within the team.</p></div>

1. [Install Fluidkeys](#install-fluidkeys)
1. [Connect Fluidkeys to your key in GnuPG](#connect-key)
1. [Extend your key, switch on automatic maintenance](#extend-key)
1. [Upload your public key to the keyservers](#upload-to-keyservers)
1. [Optional: automatically upload to the keyservers using cron](#upload-from-cron)
1. [Upload your public key to Fluidkeys](#upload-to-fluidkeys)
1. [Remind your contacts to refresh their keys](#remind-contacts)

<h2 class="numbered" id="prerequisites">Install Fluidkeys</h2>

[Install Fluidkeys &ge; 1.0](https://download.fluidkeys.com)

<h2 class="numbered" id="connect-key">Connect Fluidkeys to your key in GnuPG</h2>

Allow Fluidkeys to access your key in GnuPG:

<pre class="terminal">
<span class="command">fk key from-gpg</span>

Connecting a key allows Fluidkeys to inspect your key and fix any issues.

Found 1 key with <span class="information">gpg --list-secret-keys</span>:

<span class="information">1.</span>  01CE 9E32 C62C 22A6 ECF1  4CA5 966C 11FE 6B6C 44BC
    Created on 15 March 2019
      <tina@example.com>

Connect this key? [Y/n]
</pre>

Type `Y` to connect Fluidkeys to the key in GnuPG. (If you've more than one key in GPG, you
can select which you'd like to manage with Fluidkeys.)

Fluidkeys will then list a number of issues it has found for the key.<br />One of the issues should look
like this:

<pre class="terminal">
 <span class="notice">▸</span>   <span class="error">Primary key needs extending now (expires in 2 days)</span>
</pre>

<h2 class="numbered" id="connect-key">Extend your key, switch on automatic maintenance</h2>

To extend your key and fix any other issues, run:

<pre class="terminal">
<span class="command">fk key maintain</span>

Fluidkeys found 3 issues for tina@example.com:

 <span class="notice">▸</span>   <span class="error">Primary key needs extending now (expires in 2 days)</span>
 <span class="notice">▸</span>   Key not maintained automatically
 <span class="notice">▸</span>   Key not uploaded, unable to receive secrets

Fluidkeys will run the following actions:

     [ ] Load private key from gpg
     [ ] Extend the primary key expiry to 31 May 19
     [ ] Store updated key in gpg
     [ ] Make backup ZIP file

Make a backup of gpg and run these actions? [Y/n]
</pre>

Answer `Y` for each of three questions:

1. Make a backup of gpg and run these actions?
2. Save password to macOS Keychain / Linux keyring?
3. Automatically maintain this key from now on?

Once complete, your key will have a new expiry date set to at the end of next month.
Fluidkeys will also have updated your cipher, hash and compression preferences to best practice recommendations.

<h2 class="numbered" id="upload-to-keyservers">Upload your public key to the keyservers</h2>

Remember to upload your updated key to the keyservers:

<pre class="terminal">
<span class="command">gpg --keyserver hkps://hkps.pool.sks-keyservers.net --send-keys 'KEY-FINGERPRINT'
</pre>

<div class="callout callout--info"><p>Replace <code>KEY-FINGERPRINT</code> with your fingerprint, for example <code>A999 B749 8D1A 8DC4 73E5  3C92 309F 635D AD1B 5517</code>. Make sure it's between quote marks.</p></div>

<h2 class="numbered" id="upload-from-cron">Optional: automatically upload to the keyservers using cron</h2>

Fluidkeys automatically extends your key every month.

To ensure your key is always up to date in the keyservers, you should use `cron` to automatically
upload the key.

Edit your crontab file:

<pre class="terminal">
<span class="command">crontab -e
</pre>

then add the following line:

<pre>
@daily gpg --keyserver hkps://hkps.pool.sks-keyservers.net --send-keys 'KEY-FINGERPRINT'
</pre>

<h2 class="numbered" id="upload-to-fluidkeys">Upload your public key to Fluidkeys</h2>

If you'd like to receive secrets using Fluidkeys, you should also upload your key to the Fluidkeys server:

<pre class="terminal">
<span class="command">fk key upload</span>
</pre>

<h2 class="numbered" id="remind-contacts">Remind your contacts to refresh their keys</h2>

Your contacts will need to refresh your key from the keyservers in order to be able to use your key again.

If a contact says your key has expired, you’ll know what to tell them.

---

Any trouble, contact [help@fluidkeys.com](mailto:help@fluidkeys.com).
