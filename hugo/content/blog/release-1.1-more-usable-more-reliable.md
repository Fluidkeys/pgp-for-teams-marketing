---
title: "Fluidkeys v1.1: more usable, more reliable"
description: "Fluidkeys v1.1 improves reliability for mac users by switching from cron to launchd and other fixes. We've smoothed out the workflow of creating and joining a team."
author: Paul Fawkesley & Ian Drysdale
open_graph_image: "images/blog/release-1-1/fluidkeys-v1.1.png"
open_graph_type: "article"
date: 2019-05-08
---

_TLDR: Fluidkeys sets your team up with PGP keys, giving your team encryption superpowers. This
release improves the reliability and usability of setting up a team._

This release builds on [Fluidkeys v1: Simple PGP for teams](/blog/release-1.0-simple-pgp-for-teams/)
with usability and reliability improvements. Based on feedback from teams, it's now even easier
to get your whole dev team set up with PGP, with no need to manually exchange keys.

The main changes in this release:

* Improve reliability of background tasks with launchd and more
* Expire keys annually instead of monthly
* Disable key rotation (don't create new encryption subkeys)
* Improve `team apply` and `team authorize`
* Automatically remind and delete expired keys

[Download v1.1 now](https://download.fluidkeys.com)

## Improve reliability of background tasks

### Use launchd to run in the background

It's essential that Fluidkeys can run in the background to take care of fetching keys and
maintaining your key automatically.

We initially used `cron` since it's cross-platform, but macOS Mojave introduced some difficulties.
Mojave restricted applications' ability to edit a user's crontab, and applications running from
cron became unable to access the keychain.

On macOS, Fluidkeys now uses launchd instead of cron. From our testing so far, this is working
much more reliably.

### Don't require an unlocked key

Accessing the keychain and unlocking a key presents a whole class of possible errors. To improve
reliability of background tasks, it helps to minimise the occasions where `fk` unlocks a key.

We changed the way `team fetch` works so that, most of the time, it doesn't need to unlock your
key.

### Send specific diagnostic information to our server

When things do go wrong, we want to be able to quickly help teams get back up and running.
Previously, we just didn't have enough information and this made support impossible.

We've added two diagnostic messages that `fk` sends to our server when running in the background:

1. team fetch succeeded
2. team fetch failed (with error message)

These are only sent when running in the background (via `fk sync`) and they're only sent if you're
part of a team.

## Expire keys annually instead of monthly

Until now, `fk` generated keys which expire in about 60 days, and it would try to extend them
after about 30 days. This works fine within a Fluidkeys team, where we can ensure updated keys
are distributed among the team quickly and reliably.

But we (and lots of our users) are using PGP with contacts *outside* a Fluidkeys team. That was
causing issues: if I update my key each month but my contacts haven't set up automatic fetching
of keys, they keep seeing my key as expired.

Our ambition for fast-renewing keys was actually *creating obstacles*, the opposite of what
Fluidkeys should be doing.

For now we're switching to the more-mainstream view of extending keys for a year (roughly, see below).

### Expiries are aligned to 4 dates in the year

When I used PGP in a team of 12, we found it helped if several people's keys expired at the same
time, rather than randomly throughout the year. This meant several people would get expiry notices
at the same time, making it easier to verify with another team-mate.

With this in mind, Fluidkeys sets expiries which align to a quarter:

1. 1st February
2. 1st May
3. 1st August
4. 1st November

Fluidkeys automatically extends your key so you this should be completely transparent.

## Disable key rotation

Previously, we created a new encryption subkey each month and expired the old one. This key rotation
was a form of forward secrecy.

However, it introduced an obstacle for people using multiple devices. It was possible to
get in a situation where one device has an encryption subkey that another one doesn't.

Again, we're reigning in our ambition for now. Key rotation is great, but if we want millions
more people to use PGP, we must focus on removing obstacles.

## Improve `team apply` and `team authorize`

When you add someone to a team, there's a back-and-forth flow like this:

1. Tina (a team admin) sends Chat an invite code
1. Chat runs `fk team apply <code>` which gives him verification details
1. Chat sends his verification details to Tina
1. Tina approves Chat with `fk team authorize`

*Reminder: the team is protected by a cryptographically signed text file. Only Tina can add people
to the team (even we can't). That's why this isn't a simple click-a-link web flow.*

Both `team apply` and `team authorize` now work harder to get you through the process. At the
end, both Chat and Tina have each other's keys. Soon after, everyone else in the team does too.

## Automatically remind and delete expired keys

You shouldn't ever get one of these, but if something *does* go wrong with Fluidkeys' background
task, and it doesn't extend your key automatically, it's important that help prevent the key from
expiring.

We now send expiry reminders at 14, 7 and 3 days before expiry. We include a one-liner to extend
the key and diagnose the issue with the background task.

If keys do expire, we now delete them automatically, including all related information like
email addresses, preferences and logs. This ensures we're never trying to use broken keys, and
it protects your personal information too.

## Fluidkeys is open source and non-profit

Fluidkeys [command-line application](https://github.com/fluidkeys/fluidkeys) and
[Fluidkeys server](https://github.com/fluidkeys/api) are AGPLv3. You can do whatever you like
with the code as long as you respect the licence.

We're in the process of incorporating as a UK non-profit. This compels us to put our social
objectives before profit.  From our [articles of association](https://fluidkeys.github.io/articles-of-association/#objects):

>  The objects of the Company are to make it simple for organisations to adopt technology and
>  practices that protect personal information so that people may maintain their right to privacy,
>  enjoy civil liberty and feel confident and able to participate in public life.

Fluidkeys is free for individuals and teams of two.

[Paying for a team subscription](/pricing) supports the mission and ensures we can continue to work
on Fluidkeys.

## Try Fluidkeys now

We'd love you to try out Fluidkeys and let us know how you get on.

[https://download.fluidkeys.com](https://download.fluidkeys.com)

Please get in touch: we're excited to hear from you :)

— Paul & Ian

[Email hello@fluidkeys.com](mailto:hello@fluidkeys.com)
