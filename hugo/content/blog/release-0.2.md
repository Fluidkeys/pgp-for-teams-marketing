---
title: Announcing Fluidkeys v0.2!
description: We're building Fluidkeys to help teams protect themselves with strong encryption. Today we're excited to announce Fluidkeys 0.2, a foundation for getting team members started with PGP.
author: Paul Fawkesley & Ian Drysdale
date: 2018-10-25
---

Today we're excited to announce Fluidkeys 0.2 😄

We're building Fluidkeys to help teams protect themselves with strong encryption. For now, Fluidkeys is aimed at software development teams who are comfortable using the command line.

![Animation of the command line interface for Fluidkeys](/images/release-0-2-0-animation.svg)

In these first releases we're building a foundation for getting team members started with PGP. We've tried hard to make it extremely simple and automated by default.

With this foundation in place, we'll be able to start building more directly useful features. We need your feedback: more on that later.

If you're keen to get started, head to [download.fluidkeys.com](https://download.fluidkeys.com)

## Fluidkeys v0.2 lets you create, import, maintain and rotate keys

### Create a new best practice key

Fluidkeys can create a best-practice OpenPGP key for you, giving you a strong,
memorable password and importing it into `gpg`.

Fluidkeys doesn't ask you any difficult questions. It focuses on making a good key that you can use as soon as possible.

### Import an existing key from gpg

If you've already got a key in `gpg`, you can connect that to Fluidkeys.

Lots of keys out there use outdated preferences and old cryptography. When you connect a key to Fluidkeys, it immediately identifies a number of issues that can be fixed.

### Maintain and rotate your keys

This is where we've spent the most time, and I'm confident we're laying strong groundwork.

Keys aren't static - things change over time. Ciphers are broken and new ones are introduced.

Keys shouldn't be used forever: they should be rotated regularly to limit the damage caused by a compromise.

Fluidkeys looks for issues with your key and offers to fix them. So far, it identifies weak signature hashes, algorithm preferences which could be stronger, and expiry dates.

As well as fixing *issues*, Fluidkeys also starts rotating your key. It tries to create a new encryption subkey every 30 days and expire the old one. This ensures the new subkey is used for encrypting new data, while keeping the old one around for decrypting old data.

Similarly, Fluidkeys sets the expiry on the primary key too, extending it by 30 days on the first of each month.

Thanks to everyone who responded to our request for feedback on rotation 😊

### Fluidkeys automates by default

Several people urged us to be bolder with automation, and we were convinced.

As a design principle, Fluidkeys defaults to automating everything. People shouldn't have to answer questions, or care about maintaining their key.

If you create a brand new key with Fluidkeys, by default it'll save the (generated) password in your system keyring and configure `cron` to run itself periodically.

If you *import* a key from `gpg`, we're more cautious, but you'll be prompted if you'd like to save your password and enable automation.

Fluidkeys adds a line like this to your `crontab`:

```
@hourly fk key maintain automatic --cron-output
```

We specify hourly because we don't know when your machine will be on, though usually Fluidkeys will exit quickly with nothing to do.

## Things you should be aware of

We hope you'll start using Fluidkeys and it won't have any surprises. That said, there are a couple of things we feel you should know:

### Fluidkeys stores keys in gpg

Currently Fluidkeys doesn't implement its own storage of keys: it pushes them into `gpg`. If you delete a key from `gpg`, there's no copy in Fluidkeys. We don't modify the `GNUPGHOME` directory: we push and pull straight from your default `gpg2` installation.

Future versions of Fluidkeys will probably implement their own key store.

### Fluidkeys doesn't upload your key anywhere

Currently, when you create a key or update an existing one, the key doesn't go anywhere except `gpg`. We don't push to the public keyserver network.

This means Fluidkeys rotates your key, but there's no mechanism to synchronise it to other team members.

We're still working out what to do about this (a lot of the OpenPGP community are thinking about this too).

In the meantime, you could configure `gpg` to push your key to the keyservers.

Edit your crontab by running `crontab -e` and add this line:

```
@daily gpg --keyserver pool.sks-keyservers.net --send-key <email address>
```

### Fluidkeys stores your password in the system login keychain

For *new* keys Fluidkeys stores the password automatically. We feel OK about doing this without asking since the password is brand new.

For *imported* keys, we only store the password after asking you.

If you'd like the see how the keys are stored,

* on macOS, open Keychain Access
* on GNOME, open `seahorse` or anything else using `libsecretservice`

### On macOS we can't yet automate keychain access

On macOS the Keychain will prompt you every time Fluidkeys tries to access your stored password.

Clicking *Always allow* works until the next time Fluidkeys is run.

In order for Fluidkeys to have prompt-free access to the keychain, we need to sign up to the Apple Developer Programme. We plan to do this but it's not a 5 minute job, so we're deferring it for now.

In the meantime, we've built a workaround where you can store passwords in a text file.

To use the password file add this line to your `~/.zshrc` file:

```
export FLUIDKEYS_PASSWORDS_TOML_FILE="$HOME/.fluidkeys_passwords.toml"
```

And add these lines to that file:

```
# Fluidkeys password file.
[pgpkeys]

    # replace AAAA... with your key fingerprint which you can find by running:
    # $ gpg --list-secret-keys --fingerprint

    [pgpkeys."AAAA1111AAAA1111AAAA1111AAAA1111AAAA1111"]
    password = "the quick brown fox"
```

## Download Fluidkeys v0.2

On to business: head on over to [download.fluidkeys.com](https://download.fluidkeys.com) to get started.

<pre class="terminal">
<span class="prompt">$</span> fk --help
Fluidkeys 0.2.1

Configuration file: /home/paul/.config/fluidkeys/config.toml

Usage:
        fk key create
        fk key from-gpg
        fk key list
        fk key maintain [--dry-run]
        fk key maintain automatic [--cron-output]

Options:
        -h --help         Show this screen
           --dry-run      Don't change anything: only output what would happen
           --cron-output  Only print output on errors
</pre>

## What shall we do next?

What would you like to see in v0.3?

Here are some features we're thinking about:

* Send large files between team members quickly and securely
* Send secret snippets between team members
* Turn on code signing and validation for all team members
* Configure a mail program for encrypted email
* Archive data with PGP encryption
* Send encrypted emails to your users from your SaaS product

We're particularly interested in hearing from:

* people working in a professional development team
* with problems that cause the team pain
* with budget to spend on solving those problems

Thanks for reading. You rock.

— Paul & Ian

We love hearing from you. [Email us now](mailto:hello@fluidkeys.com)
