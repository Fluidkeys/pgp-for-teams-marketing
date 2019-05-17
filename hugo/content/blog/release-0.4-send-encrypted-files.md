---
title: "Send private keys and certs from the terminal"
description: With Fluidkeys 0.4 you can send SSL certificates and private keys direct from the terminal.
author: Paul Fawkesley & Ian Drysdale
open_graph_image: "images/blog/release-0-4/fluidkeys-0.4-release.png"
open_graph_type: "article"
date: 2019-02-12
---

Today we're pleased to announce Fluidkeys v0.4 😄

As well as pasting secrets, you can now send *sensitive files* like SSL
certificates and private keys using end-to-end encryption.

![Terminal showing sending a secret file to a team-mate](/images/blog/release-0-4/release-0-4-send-secret-file.svg)

If you're keen to get started, head to [download.fluidkeys.com](https://download.fluidkeys.com)

## Share sensitive files safely

In our [0.3 release](/blog/release-0-3-send-encrypted-secrets/) we introduced
sending secrets like passwords, API tokens and other credentials. These are pasted or piped into
Fluidkeys.

You told us that certain types of secrets are fundamentally *file-like* and the
filename and extension matter.

Now you can send files too:

<pre class="terminal">
<span class="prompt">$</span> fk secret send 2019-02-12-staging.pem --to paul@fluidkeys.com
</pre>

The filename, `2019-02-12-staging.pem`, is sent encrypted along with the content.  The person
receiving your secret sees that filename and can choose to save the file to a
downloads directory. That saves them copy and pasting the secret into an editor.

## Other changes in 0.4

### Save or copy secrets

To save you copy pasting into an editor and choosing a filename, Fluidkeys
offers to save file-like secrets:

<pre class="terminal">
<span class="prompt">$</span> fk secret receive
...
Save to ~/Downloads/2019-02-12-staging.pem? [y/n]
</pre>

People using `tmux` in split-screen mode struggle to copy multiple lines.
Fluidkeys offers to copy paste-like secrets to the clipboard:

<pre class="terminal">
<span class="prompt">$</span> fk secret receive
...
Copy to clipboard? [y/n]
</pre>


### Lots of interface improvements

* Secrets now "self destruct" automatically, instead of prompting you to "delete" 💥
* Fluidkeys hints that you need to notify the recipient to check for secrets 💬
* Improved error messages everywhere ⚠️
* Better previews for long secrets 🔎

## Install and set up Fluidkeys in 2 minutes

We've heard from a number of teams that it's time consuming to set up new
starters with PGP.

It takes around 2 minutes for new users to install Fluidkeys, generate a PGP
key, verify your email and start sending and receiving encrypted secrets.

[Take the two-minute challenge](https://download.fluidkeys.com)

## Things you should know

### Files must be UTF8 text up to 10K

This release allows sending small text secrets. If you're interested in sending
binary files or other large files, we'd love to understand your use case. Get
in touch with the email below.

### Fluidkeys rotates your key each month

Fluidkeys creates a new encryption subkey each month for forward secrecy. It
sets a short expiry on your primary key instead of relying on revocation.

Each month your updated public key is rotated and automatically uploaded to our
server to ensure it's available for others to find.

### Fluidkeys stores your keys in gpg

Beware that Fluidkeys uses `gpg` to store its keys. If you delete a key from
`gpg`, there's no copy in Fluidkeys. We don't modify the `GNUPGHOME` directory:
we push and pull straight from your default `gpg2` installation.

Using `gpg` means keys made by Fluidkeys will automatically work with anything else
that uses `gpg` such as `git` for signing commits.

*Future releases will introduce integrations to configure 3rd-party tools like git, pass, git-crypt*

### Fluidkeys stores your key's password in your system keychain

In order to be able to rotate your key automatically, Fluidkeys stores the
password to your private key in your system keychain. You can see these by
searching for "Fluidkeys".

### Fluidkeys doesn't use the public keyserver network

We chose not to use the public keyserver network until it supports deleting
keys and cryptographic validation.

If you do want to upload to the public keyservers, make sure you automate it.
Because Fluidkeys automatically rotates your encryption subkey every month,
your key will quickly become out of sync with the keyservers. You could add
cron task to upload your key regularly:

Edit your crontab by running `crontab -e` and add this line:

```
@daily gpg --keyserver pool.sks-keyservers.net --send-key <email address>
```

### Fluidkeys fetches verified public keys from our server

When you install and set up Fluidkeys, you're asked for your email address.
Once you've verified it, others can send you secrets. You don't need to
manually exchange public keys.

Fluidkeys automatically fetches keys based on the verified email address and
encrypts the secret to the key.

We use [our own server](https://github.com/fluidkeys/api) to store public keys
and transmit encrypted secrets.

## Next release: Automatic Key Management for your Team

**Our vision for Fluidkeys is bigger than sending secrets.**

Fluidkeys will make PGP simple to use as a team, safely automating all the awkward
configuration and key management. Then you can use all the great tools and
technology that already exist and work together.

Specifically, Fluidkeys will:

* Automatically rotate your team's keys
* Fetch and verify keys of team members
* Set up signing and verifying git commits
* Configure tools like `pass`, `git-crypt`, enigmail, Mailvelope and others
* Ensure others can find your keys using Web Key Directory

Take a look at our [roadmap](/#roadmap) to see our progress and [our new preview site](/fluidkeys-v1-preview/) for a better idea.

And if you haven't already, [sign up for release announcements like this one!](/)

## Download Fluidkeys v0.4

On to business: head on over to [download.fluidkeys.com](https://download.fluidkeys.com) to get started.

<pre class="terminal">
<span class="prompt">$</span> fk --help
Fluidkeys 0.4.0

Configuration file: /home/paul/.config/fluidkeys/config.toml
          Log file: /home/paul/.config/fluidkeys/debug.log


Usage:
    fk setup
    fk setup &lt;email&gt;
    fk secret send &lt;recipient-email&gt;
    fk secret send [&lt;filename&gt;] --to=&lt;email&gt;
    fk secret receive
    fk key create
    fk key from-gpg
    fk key list
    fk key maintain [--dry-run]
    fk key maintain automatic [--cron-output]
    fk key upload

Options:
    -h --help         Show this screen
       --dry-run      Don't change anything: only output what would happen
       --cron-output  Only print output on errors

</pre>

## What do you think?

Please have a go and let us know how you get on!

We're excited to hear from you :)

— Paul & Ian

[Email hello@fluidkeys.com](mailto:hello@fluidkeys.com)
