---
title: "Disconnect a key from Fluidkeys"
weight: 6
---

# Disconnect a key from Fluidkeys

<h2 class="numbered">Find the fingerprint if the key to remove</h2>

Run `fk status` and identify the email address associated with the key you want to delete:

<pre class="terminal">
<span class="command">fk status</span>

<span class="header"> Keys that are not in a team</span>

Email address           Created     Status
----------------------  ----------  ---------
<span class="highlight">jayne-test@example.com</span>  5 Jul 2018  <span class="positive">Good ✔</span>
----------------------  ----------  ---------
</pre>

Find the fingerprint of the key you want to remove by using GnuPG:

<pre class="terminal">
<span class="command">gpg --list-secret-keys jayne-test@example.com</span>
<span class="output">/Users/jayne/.gnupg/pubring.kbx
-----------------------------------
sec   rsa4096 2018-09-04 [SC] [expires: 2019-05-31]
      <span class="highlight">FE03EDE3EA5A67D537F6BA1C73480732A25E2F5F</span>
uid           [ultimate] &lt;jayne-test@example.com&gt;
ssb   rsa2048 2019-04-04 [E] [expires: 2019-05-30]</span>
</pre>

<h2 class="numbered">Delete the key from `db.json`</h2>

Open the Fluidkeys database `~/.config/Fluidkeys/db.json` in a text editor.

Remove the entry for the key and save the file:
<pre>
{
    "KeysImportedIntoGnuPG": [
<div class="highlight">        {
            "Fingerprint": "FE03EDE3EA5A67D537F6BA1C73480732A25E2F5F"
        }</div>    ],
    "RequestsToJoinTeams": [],
    "EventTimes": {
    }
}
</pre>

<h2 class="numbered">Verify your key is no longer connected</h2>

Run `fk status` once more and you should no longer see the key! Success!
