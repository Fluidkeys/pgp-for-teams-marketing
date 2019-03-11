---
date: 2018-12-21
title: "Week 20: Quietly releasing 0.3"
author: Ian Drysdale
---
**Protecting liberty by simplifying security**

_Recap_: We’re building Fluidkeys, to help you easily send end-to-end encrypted secrets using PGP.

Using Fluidkeys reduces the impact of third-party data breaches, targeted spearphishing attacks and network compromise.

## The short version:
* We wrestled with how macOS stores passwords in its keychain ⛓
* Paul took more calls! ☎️
* We released! Fluidkeys now guides you through getting setup to send and receive secrets!🕵️‍♀️

## macOS keychain shenanigans
The [macOS keychain](https://www.umkc.edu/is/support/services/macintosh/keychain.asp) is a bit of software that you can use to store your passwords on. It’s useful since as it means you put them on it and then forget all about them. The programs that you stored your passwords can later retrieve them when needed, since your keychain unlocks when you log into your mac each time.

We’ve made Fluidkeys store your key’s strong password on the keychain, but had got ourselves in a bit of muddle. The password on the keychain wasn’t accessible to a job that runs every hour in the background to check whether it needs to rotate and update your key. So we lost a day or so to debugging and fixing that. Pleased to say it’s working!

## Learning more about how people use encryption
Paul also had another four interesting calls with people about how they're using PGP and encryption, including speaking to an auditor. I feel all these calls over the past few weeks have really helped us understand more about the different pains people using PGP experience. With Fluidkeys now in a place where it's delivering some minimum value, I'm sure we're going to learn so much more now we're able to release. Exciting! 🚀

## We’ve (quietly) released 0.3
As of today, you can get your team setup on Fluidkeys and send end-to-end encrypted secrets to one another from the command-line!

Paul will announce it properly soon, but if you can’t wait go ahead and [download it now](https://download.fluidkeys.com/).

[Secret Squirrel](https://www.fluidkeys.com/weeknotes/week-19/) made it into the command line, see if you can see where!

I’m off on holiday now until mid January, so you’ll be hearing from Paul in the new year. Thanks to everyone who’s been following along, it’s been incredibly helping receiving your words of support and advice as we’ve gone this year!

Have a fantastic holiday and happy new year!

— Ian

*All* feedback is welcome, pop us an email to
[hello@fluidkeys.com](mailto:hello@fluidkeys.com)
