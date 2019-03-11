---
date: 2018-09-07
title: Week 5, Backups
author: Ian Drysdale
---

## The short version

This week we:

* got Fluidkeys to make a revocation certificate for your key and back it up
* refreshed our homepage showing our planned roadmap
* presented at the Liverpool Linux User Group meetup
* decided 0.2 will allow you to setup key rotation

## Fluidkeys now automatically creates and backs up revocation certificates when creating a key

Two years ago I created a PGP Key, pushed it to a key server and then forgot about it. I also forgot my password that I used to secure it 🤦‍ This basically renders the key useless. Worse still, it didn't have an expiry date! Fortunately, PGP has a way you can mark such a dud key as `revoked`. The catch is that in order to do this, you need to have generated a revocation certificate... which is impossible if you've forgotten your password! 😡

We figured it'd be sensible for Fluidkeys to automatically create this revocation certificate for you when you create a key and back it up for you. That way, if you do ever run in to problems with they key it's easy to mark it as revoked.

## Fluidkeys roadmap is now online

We've refreshed our homepage at www.fluidkeys.com. On it we now have a checklist of features working towards our 1.0 release. We also decided to make our Trello board (of prioritised tasks) public. If you _really_ want to snoop on us, this is the detail 🔎

## Paul presented at Liverpool Linux User Group (LivLUG)

On Wednesday evening, Paul presented at the monthly Liverpool Linux User Group. He spoke about the superpowers that PGP can give people, but the challenges they face in using it. We also demoed Fluidkeys. Thanks to everyone who came along we had a great discussion afterwards. We were looking for connections to sysadmins that might want to test it and for introductions to open source entrepreneurs who'd successfully built businesses around their software.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Here at the <a href="https://twitter.com/livlug?ref_src=twsrc%5Etfw">@livlug</a> meeting at <a href="https://twitter.com/DoESLiverpool?ref_src=twsrc%5Etfw">@DoESLiverpool</a> this evening to hear about <a href="https://twitter.com/hashtag/PGP?src=hash&amp;ref_src=twsrc%5Etfw">#PGP</a> <a href="https://twitter.com/hashtag/encryption?src=hash&amp;ref_src=twsrc%5Etfw">#encryption</a> and <a href="https://twitter.com/hashtag/privacy?src=hash&amp;ref_src=twsrc%5Etfw">#privacy</a> and FluidKeys (their new project) from <a href="https://twitter.com/paul_furley?ref_src=twsrc%5Etfw">@paul_furley</a> and <a href="https://twitter.com/idrysdale?ref_src=twsrc%5Etfw">@idrysdale</a> <a href="https://twitter.com/hashtag/weeknotes?src=hash&amp;ref_src=twsrc%5Etfw">#weeknotes</a> <a href="https://t.co/FQiVghujaW">pic.twitter.com/FQiVghujaW</a></p>&mdash; Adrian McEwen (@amcewen) <a href="https://twitter.com/amcewen/status/1037412682947874816?ref_src=twsrc%5Etfw">September 5, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

## Fluidkeys 0.2 will automatically rotate your keys each month

We've got Fluidkeys generating new keys, or linking to keys you've already made in GPG. Now time for something more useful: key rotation!

Key rotation is what it sounds like, tossing out an old one, and replacing it with a new one. OpenPGP allows you to do key rotation without having to make a whole new key, but it involves fiddly subkeys and in practice very few people do it.

1. If your key becomes compromised the amount of data you've exposed will be limited.

2. With some ciphers, the more data that you've encrypted with your key, the easier it will be to crack. By rotating the key you limit the amount of data you'll ever use against each one. ([more on that on crypteron.com](https://www.crypteron.com/blog/pci-dss-key-rotations-simplified/]))

Confession time: I don't rotate my key. 😈

Fluidkeys 0.2, by automatically rotating my key, would be instantly useful... And it's a step towards a team service that would do this and keep them all in sync across your organisation. But I'm getting ahead of myself. More on that soon...

— Ian

*All* feedback is welcome, pop us an email to [paul@paulfurley.com](mailto:paul@paulfurley.com) and [idrysdale@gmail.com](mailto:idrysdale@gmail.com)
