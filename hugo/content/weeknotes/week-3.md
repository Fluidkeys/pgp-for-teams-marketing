---
date: 2018-08-24
title: Week 3, Released 0.1 🎉
author: Paul Furley
---

## The short version

This week we:

*   released version v0.1 of Fluidkeys and sent it to 10 people
*   extended the Go x/crypto/openpgp library
*   committed to a theme for v0.2

## We released Fluidkeys v0.1

[In last week's notes](https://www.fluidkeys.com/blog/week-2/) I explained that v0.1 would help people generate a best practice PGP key, and went through some of the usability ideas we wanted to implement.

This week was extremely focused, with a lot of pairing, learning, and building the first release. It was extremely helpful having a clear goal of what the release would do, so we could crank through tasks on trello, seeing it appearing bit by bit.

Ian's got really into test-driven development — he's literally building broken tests first, then implementing the code to pass the tests. It's keeping me honest — it's easy to fall into bad habits of "I'll test this later", but then you fail to. It's a short-term investment in time (it takes longer to write code with tests) with a very clear long term return (it's much easier to iterate code in the future with a solid test suite).

Anyway [we managed to release Fluidkeys v0.1](https://www.fluidkeys.com/blog/release-0-1/) — a little delayed, but released all the same. We sent it to our original research participants and others in the community, and already had some great feedback, for which we're extremely grateful.


## We extended x/crypto/openpgp

I'm really enjoying working with Go, which feels like it was made for incredibly picky people…

It's got a cool standard library, and we've benefitted from there being a lot of openpgp code already written.

It's missing a key feature though, which is password-encrypting private keys. This matters for Fluidkeys in two places:



1.  We output a backup ZIP file containing the public and private key. People should be able to copy the ZIP file to somewhere like Dropbox without giving Dropbox access to their private key, and without having to _further_ encrypt the file.
1.  Fluidkeys imports the new key into GnuPG. Without a password, any code running on the machine could simply call GnuPG in the background and use the key to sign things, decrypt things, and so on.

We toyed with the idea of not using a password, but ultimately couldn't do this in good faith while claiming the key follows "best practice".

I must admit, adding password encryption to [Go's openpgp library](https://godoc.org/golang.org/x/crypto/openpgp) was a challenge. I'm pretty familiar with good old [RFC 4880](https://tools.ietf.org/html/rfc4880) but I don't find it well written, so it wasn't clear how encrypted private keys should be constructed. There were a few grumpy, frustrated moments, with screens half full of debug output, and the other half filled with impenetrable ramblings from the spec.

We got there in the end, and after a bit of cleanup and more testing we're going to submit it back to Google to try and get [our fork](https://github.com/fluidkeys/crypto/tree/encrypt-private-key) back into the core library. That'll be something.


## Fluidkeys 0.2 will help you work with existing keys

The first release was all about _generating_ _a new key_ and getting it into GnuPG. But it's a little underwhelming if you're already using GnuPG — when you run it again, it just tries to make you another key…

Considering about how Fluidkeys could get adopted in a team, and based on what we've already learned about teams using PGP, we're thinking about two different types of person.

(Excuse the clumsy over-generalisation, but this persona-ish approach is useful for thinking about this point):



*  **Tina, product lead & privacy champion**
    *   Tina feels responsible if something went wrong with the product, like a data breach. She wants to get the team using end-to-end encryption for sharing personal data inside the team, rather than via a cloud provider
    *   Tina is pretty confident using PGP already but is not a cryptography expert and isn't sure about best practice.
    *   Tina is the driving force behind adopting PGP in the team, but finds it very difficult to teach to other team members.
    *   Tina spends several hours setting up new developers on the team with PGP, and several hours a month helping with forgotten passwords and weird error message using GPG.
*  **Chat, a frontend developer**
    *   Chat understands why Tina advocates for using PGP, but hasn't used it before
    *   Chat is a great developer but isn't interested in learning the details of how end to end encryption works
    *   Chat trusts Tina to make decisions on his behalf about how to use PGP

We are much more likely to reach people like Tina than Chat, so it's really her we're focusing on helping.

**We need to make it really easy for Tina to get Chat using PGP.**

For Tina, Fluidkeys 0.1 helps a bit: she can ask Chat to install it, knowing he'll be able to make himself a good key and he probably won't forget the password. He won't be asked lots of difficult questions and it won't be a horrible first experience.

This version _may_ also help if Tina's unsure whether her key is any good. Does it use the right key size? Are the cipher preferences configured correctly? If she's not too attached to her existing key, she may actually use Fluidkeys to make herself a brand new key and ditch the old one.

**If not, Fluidkeys needs to let Tina use her existing key**.

Fluidkeys is going to help teams manage their keys. It would never mess with people's existing keys without them asking, but it's important to give them the option.

Personally, my own key is far too well spread around the internet for me to want to make a new key without a good reason. I need to be able to ask Fluidkeys to use my existing key.

So that's what we're doing next. Then we can get onto the cool stuff.

Thanks for reading.

— Paul

*All* feedback is welcome, pop us an email to [paul@paulfurley.com](mailto:paul@paulfurley.com) and [idrysdale@gmail.com](mailto:idrysdale@gmail.com)

(Also available as [RSS/Atom](https://www.fluidkeys.com/blog/feed.xml), thanks very much to Sym)
