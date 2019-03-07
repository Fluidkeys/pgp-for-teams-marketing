---
date: 2018-10-26
title: "Week 12: Fluidkeys v0.2 and the OpenPGP Email summit"
author: Paul Fawkesley
---

*Recap*: we're building a product that makes it easy for software teams to
implement great security across their organisations. We’re currently coding a
command line application that'll be a foundation for further functionality.

## This week

This week has been incredible and exhausting. At the weekend I was at the
 [OpenPGP Email Summit](https://blog.mailfence.com/openpgp-email-summit/) in
Brussels, and right now I'm on my way to MozFest in London.

Midweek, I joined Ian in Sheffield where we hit a major milestone: we released Fluidkeys v0.2!

## Ian led a UI crit

In Wednesday Ian pulled us through an extremely thorough review of *every* bit of content in Fluidkeys.

Looking at everything in one place with fresh eyes was illuminating. We re-wrote loads of things and created a collection of design patterns and nomenclature. Things like, Fluidkeys *makes a backup* rather than Fluidkeys *backs up*. It's amazing how many different ways we were talking about the same things. After the crit Fluidkeys is feeling a lot more consistent and clear.

## We released v0.2

It's been a long time coming, but we did it. This version of Fluidkeys can create, import and automatically maintain and rotate PGP keys.

I'm delighted with it. Take a look at the [the release notes](/blog/release-0-2/), including a very cool terminal animation Ian knocked up.

## Observations from the OpenPGP summit

It was an absolute pleasure to catch up with others from the community in Brussels. It was non-stop thinking, chatting, learning, hacking and socialising. It was also an incredibly warm and friendly scene which is lovely to see.

While it's still fresh, I'm going to use this weeknote to jot down some thoughts from the summit.

## Usability is top of the agenda

My favourite quote from the weekend was:

> The threat model for email encryption is that no-one uses it.

It's absolutely clear that most people acknowledge that past approaches have failed: only a few million people worldwide use email encryption.

The old idea that you need to deeply understand cryptography in order to use has been scrapped. People are thinking hard how to hide and automate everything.

This is *great news.*

## Autocrypt looks more promising than ever

[Autocrypt](https://autocrypt.org/) is a set of guidelines that describes how mail programmes can *automatically* negotiate encryption with other email contacts.

It's mind-blowing to see two Autocrypt-enabled mail clients transparently discover keys and start encrypting. This is exactly how it should be.

Another great quote from Autocrypt's design principles:

> Don't talk about keys. Ever.

Yep.

## Automatic key discovery is where it's at

Key discovery means finding a public key from an email address.

Autocrypt achieves this by embedding keys in the header of outgoing emails.

Additional discovery mechanisms are emerging. [Web Key Directory (WKD)](https://tools.ietf.org/html/draft-koch-openpgp-webkey-service-06) uses the `/.well-known/openpgpkey` directory over HTTPS. If a client has an email address, they map it to a specific URL, and request that URL for a key.

We [implemented this today](https://github.com/fluidkeys/web-key-directory) using a Github repository as the backend.

WKD has some issues and the documentation is challenging, but it's a great concept. We sent out our release note with a `reply-to` header pointing to `hello@fluidkeys.com`. Any WKD-enabled mail client will automatically find the key and use it to encrypt to us.

(The git-repo concept won't scale since we're rotating keys every month. Fluidkeys will publish to WKD automatically, sooner or later...)

## OpenPGP is finally bigger than GnuPG

I found it great to see the OpenPGP standard actually being used *as a standard*, with multiple implementations talking the same language.

It used to feel like OpenPGP meant GnuPG. That meant applications bundling a binary of gpg then calling it via its command-line interface.

There's still plenty of that, but some decent first-class implementations have emerged too:

* [OpenPGP.js](https://openpgpjs.org/)
* [Sequoia](https://sequoia-pgp.org/), a new Rust implemtation
* [golang/crypto](https://github.com/golang/crypto/) (ProtonMail maintain a [significant fork](https://github.com/protonmail/crypto))

## Delta chat is my favourite new app

[Delta chat](#) looks just like your favorite messaging app, but it *sends messages via email*. I didn't get why this was a big deal initially until I started using it.

I find it strangely delightful that everything's an email. There's no centralised service snooping on my contacts. It's difficult for censors to block it (other than blocking email itself, with the collateral damage that involves)

Delta chat has a cunning (experimental?) feature where you can scan a special QR code, and somehow you get a throwaway email account, and the app seamlessly logs in to it. I think it does some key exchange, and perhaps joins a chat group too (not sure on the detail here).

I can imagine this being useful for events like the [Internet Freedom Festival.](https://internetfreedomfestival.org) Participants could scan a barcode on the door and have a super-secure, anonymous chat group while they're at the event. Afterwards, the accounts could be thrown away.

## The keyserver network needs some love

The public keyserver network is run by a group of volunteers mostly using software called [SKS](https://bitbucket.org/skskeyserver/sks-keyserver).

Keyservers are used to fetch updates for keys, for example new subkeys and revocation signatures.

(They're also widely used for key *discovery* from an email address, but this is less than ideal since there's no validation of email addresses.)

In recent months the cracks began to show when a researcher uploaded a specially crafted key which broke many SKS instances.

SKS is written in the obscure language OCaml, using the obscure source control system mercurial, and an extremely obscure key reconciliation protocol descibed in pages of mathspeak.

All this obscurity means no-one is confident to make any major changes to SKS. And so it remains broken.

The result to end-users is that key lookups can hang and time-out, giving an overall bad impression of the software and email encryption in general.

## Most of us want to simplify the standard

On the second day of the summit a number of us got together to discuss how to slash the standard.

The standard is enormous. There are multiple ways of doing the same thing and way too many choices of algorithms. Why do we need AES192 when we've got AES256? This bloat makes it difficult for new people to enter the community and it's extremely daunting to build a new implementation.

A number of us agreed a strategy for dropping the cruft over time. We started defining what "simplified openpgp" would look like, and we'll commit to *only* outputting data within that subset. Over time, we'll be able to measure how many times obsolete features are used and make an informed decision when to remove it altogether.

The outstanding issue with dropping obsolute features *completely* is being able to decrypt old email archives. *Someone* has to maintain software that can open those old formats. But for many apps like Delta Chat, I don't think there'll be any point supporting obsolete features.

Wow, that was quite a braindump. Hopefully I'll be able to sleep better now that's all out :)

Thanks for reading!

Paul

*All* feedback is welcome, pop us an email to
[hello@fluidkeys.com*](mailto:hello@fluidkeys.com)

*bonus points if it comes encrypted*
