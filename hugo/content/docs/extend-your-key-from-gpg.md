---
title: "Extend your PGP key from GPG with Fluidkeys"
weight: 4
---

# How to extend your PGP key expiry date with Fluidkeys (and never have to do it again)

Fluidkeys is a command line application that makes it simple for engineering teams to get up and
running with PGP.

You can use it to automatically maintain a key you've already made using GnuPG, send end-to-end encrypted secrets to other and use `pass` the open-source unix password manager to manage your team passwords.

Contents:

1. [Prerequisites](#prerequisites)
2. [Import your PGP key into Fluidkeys](#import-key)
3. [Upload your public key to the keyservers](#upload-to-keyservers)
4. [Upload your public key to Fluidkeys](#upload-to-fluidkeys)
5. [Remind your contacts to refresh their keys](#remind-contacts)

<h2 class="numbered" id="prerequisites">Prerequisites</h2>

You'll need:

* [Fluidkeys](https://download.fluidkeys.com) &ge; 1.0
* An existing PGP key stored in [GnuPG](https://www.gnupg.org/)

<h2 class="numbered" id="import-key">Import your PGP key into Fluidkeys</h2>

Import your existing key stored in GnuPG to Fluidkeys by running `fk key from-gpg`.

When asked to "Connect this key?" type `Y` to say yes. (If you've more than one key in GPG, you
can select which you'd like to manage with Fluidkeys).

Fluidkeys will then list a number of issues it has found for the key.<br />One of the issues should look
like this:

<pre class="terminal">
 <span class="notice">▸</span>   <span class="error">Primary key needs extending now (expires in 2 days)</span>
</pre>

To fix this and any other errors, run `fk key maintain`.

You'll be asked three questions, answer `Y` for each:

1. Make a backup of gpg and run these actions?
2. Save password to macOS Keychain / Linux keyring?
3. Automatically maintain this key from now on?

Once complete, your key will have a new expiry date set to at the end of next month.
Fluidkeys will also have updated your cipher, hash and compression preferences to best practice recommendations.

<h2 class="numbered" id="upload-to-keyservers">Upload your public key to the keyservers</h2>

Remember to upload your updated key to the keyservers:

<pre class="terminal">
<span class="command">gpg --keyserver hkp://pool.sks-keyservers.net --send-keys 'A999 B749 8D1A 8DC4 73E5 3C92 309F 635D AD1B 5517'
</pre>

Given that you're key will be modified each month now, you should now setup a `cron` task to run this command on the 1st of each month.

To do that, edit your cron file run by running `crontab -e` and add the following line:

<pre class="terminal">
0 0 1 * * gpg --keyserver hkp://pool.sks-keyservers.net --send-keys 'A999 B749 8D1A 8DC4 73E5 3C92 309F 635D AD1B 5517'
</pre>

<h2 class="numbered" id="upload-to-fluidkeys">Upload your public key to Fluidkeys</h2>

If you'd like to receive secrets using Fluidkeys, you should also push your key to the Fluidkeys server:

<pre class="terminal">
<span class="command">fk key upload</span>
</pre>

<h2 class="numbered" id="remind-contacts">Remind your contacts to refresh their keys</h2>

Your contacts will need to refresh your key from the keyservers in order to be able to use your key again.

If a contact says your key has expired, you’ll know what to tell them.

---

Any trouble, contact [help@fluidkeys.com](mailto:help@fluidkeys.com).
