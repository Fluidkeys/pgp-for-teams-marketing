---
title: "Week 41: Focus! Fluidkeys is about sending secrets"
author: Paul Fawkesley
date: 2019-05-17
open_graph_image: "images/weeknotes/week-41/open-graph-card.png"
---

_Recap_: Fluidkeys is the best way to send passwords, certificates and other secrets around your
organisation.

## The short version

* We had our first away day!
* We're (finally) incorporated 🎉
* We've decided to focus Fluidkeys on *one* use case.
* You can still use Fluidkeys with `git`, `pass`, Enigmail etc with *Recipes*
* We've been finishing `fk team edit`

## We had our first away day!

Three quarters in and we had our first "quarterly" away day!

On Thursday we went for a hike in the sunny peak district around Ladybower reservoir.

It's important to get together in real life (we work in different cities) and healthy to have some
time in nature to think a bit differently.

![Paul and Ian in the peak district](/images/weeknotes/week-41/paul-and-ian-in-the-peaks.jpg)

## We're (finally) incorporated 🎉

It's taken a while, but we're officially a non-proft!

And now we can finally reveal our company name!

[See our listing on Companies House...](https://beta.companieshouse.gov.uk/company/11999992)

For the governance geeks among you, here are our
[articles of association](https://fluidkeys.github.io/articles-of-association/) which contain our
social mission.


## Focus, focus, focus

We've found ourselves in a tricky situation where we've got a number of companies trialling
Fluidkeys, but they're each interested in *different features.*

We've been trying to work on several strands at once:

* sending secrets with end to end encryption
* storing team credentials and passwords in `pass`
* signing commits with `git`
* encrypting email with Enigmail / Mailvelope

As we've had feedback from different teams, we've been pushing each strand forward a little bit.
But with only two of us, this split focus means no single strand moves forward enough to become
really valuable.

For a while we've been feeling like we're spread thin. We've felt frustrated that we can't move
the product forward quickly enough.

### Talking about Fluidkeys

Building a product that does more than one thing makes it very hard to talk about.

We've talked about Fluidkeys as "Simple PGP for teams", following up with "oh, and you can do X, Y
and Z". Because PGP is such an all-purpose protocol, it felt right to big up all the things you
*could* do with it.

I don't think that's a compelling way to talk about it. Using an open standard (OpenPGP) is
important, but it's not the core proposition.

This week we made a diagnosis (thanks to [Good Strategy, Bad Strategy](http://goodbadstrategy.com/)
for the clarity of thinking here).

Like the best diganoses, it's very simple:

*Fluidkeys is trying to be all things to all people. The lack of focus makes it impossible to do
any one thing exceptionally well.*

We've decided to focus Fluidkeys on being the *best way of sending secrets.* We understand this
problem, we know a number of teams that have it, and we already know about four of five major
improvements we could make just in this area.

See how it simplifies the message:

*Before:*

> **Simple PGP for engineering teams.**
> Fluidkeys helps your team protect sensitive information by simplifying powerful encryption tools.

*After:*

> **Send encrypted secrets.**
> Keep sensitive information out of your email and slack logs.
  Powered by OpenPGP.

Take a look at our [new homepage.](https://www.fluidkeys.com). The [old one is archived here.](https://www.fluidkeys.com/archive/v1)

## Use `pass`, `git-crypt` and others with Recipes

We're not moving away from OpenPGP, and we plan to continue storing keys in GnuPG. That means other
tools will continue to benefit from Fluidkeys' fetching and storing team keys automatically.

However at this point we don't plan on integrating directly with tools like `pass` and `git-crypt`.

Instead, we'll provide "recipes" for using those tools with Fluidkeys. These will be short
tutorials with code snippets to get the tool interacting with Fluidkeys.

This will require 1 or 2 new generic subcommands like `fk team dump` to output your team's keys or
emails.  Then you'll be able to wire up Fluidkeys with any other tool you fancy.

Now, rather than Fluidkeys being about setting up PGP, instead it's about sending secrets, and
as a *nice side effect* your team all gets PGP keys you can use for other things.

## We've been finishing `fk team edit`

Teams will still play an essential role in Fluidkeys. They are the foundation for *verifying*
identity, ensuring secrets are encrypted to the correct recipient.

In between rebuilding our website we've been working on `fk team edit` to let teams modify their team.

Now you can have multiple administrators in a team, but that brings new challenges. It's now easier
to get in a pickle where different team members have different versions of the roster.

Long story short, the signed team roster is now *versioned*. When the team is modified, the version
number is incremented by 1. When each client checks for an update to the roster, they must download
*all previous versions* of the roster and verify them in order.

Reminder: Only you can add or remove people from the team - even we can't! That's enforced by
cryptographic signing, and it's the reason why `fk team edit` isn't a straightforward API request.

## Next week: release `fk team edit` and start improving secrets

Next week we'll release a minor update to `fk` and the API providing `fk team edit`. Then we're
done with team management, and we'll get onto implementing some of the excellent feedback we've
had about sending secrets.

— Paul

_All_ feedback is welcome, pop us an email to [hello@fluidkeys.com](mailto:hello@fluidkeys.com)
