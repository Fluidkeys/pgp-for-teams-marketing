---
title: "Simple PGP for teams: Fluidkeys 1.0"
description: Today's release makes it simple to use PGP in a team. Fluidkeys simplifies key verification and automates key exchange so any GnuPG-powered tools just work out the box.
author: Paul Fawkesley & Ian Drysdale
open_graph_image: "images/fluidkeys-1.0-release-simple-pgp-for-teams.png"
open_graph_type: "article"
date: 2019-03-26
---

_TLDR: As engineers we know our team should be encrypting data and signing software. We know this is
possible with GnuPG & other PGP tools, but few succeed. Using PGP in a team is painful.
Today's 1.0 release of Fluidkeys makes it painless to use PGP in a team by simplifying verification
and automating configuration and key exchange._


## As engineers, we all know how to improve security

Ian and I are trying to make the world safer and more secure.

As engineers, _we all know_ how important it is to protect sensitive data which could lead to a
compromise of our users' personal information.

Strong cryptography is part of the solution—end to end encryption and signing—and powerful tools
like GnuPG have been around for decades.

Logically, by now we should be encrypting all our emails, credentials, certificates and backups, and
signing all our software to keep our users safe...

## Great security is still the exception

Few engineering teams sign or encrypt emails as a matter of course. We share confidential data over
Slack, we let our email providers read and archive our emails, we trust in dubious third parties and
we release software without signatures, endangering our users.

Given that we have the knowledge, motivation and tools, why aren't we using them?


## Complexity, friction and individualism hold back tools

From talking to dozens of engineering teams who care deeply about security but struggle to use GnuPG
or other OpenPGP tools, we've discovered 3 patterns:



*   **Existing tools target expert users.** They expose complexity and require an education in
    cryptography.
*   **Existing tools introduce friction.** They make people's jobs more difficult, creating a false
    tradeoff between security and productivity.
*   **Existing tools were designed for individuals**. They don't prescribe workflows for teams.

<img src="/images/new-homepage/confusing-key-exchange-slim.png" class="markdown-illustration" %>

## Fluidkeys 1.0 makes PGP simple for teams

Today we proudly announce Fluidkeys v1.0 🙌🏽

Fluidkeys is a command-line application which gives your team PGP superpowers. It's designed to
remove friction, avoid asking difficult questions, and automate team workflows.

With our first teams release, you can:



*   **automate rotation and key exchange among the team**—so you've got the benefit of forward
    secrecy, but never have to email keys around or look on the keyservers.
*   **send passwords, certificates and tokens**—so your team has a strong default way to share
    sensitive data with frictionless end-to-end encryption.
    <img src="/images/new-homepage/send-secrets.png" class="markdown__illustration" />
*   **configures other tools to work out the box**—so GnuPG, enigmail, GPGMail, pass and other tools
    can see everyone's keys with the correct trust settings
    <img src="/images/new-homepage/supercharge-gpg.png" class="markdown__illustration" />


## New in 1.0: signed team rosters

Along with a flurry of fixes and improvements, the major change in this release is a secure way to
create and manage a team.


### The roster defines who's in the team

Your team is defined in a _signed team roster_. This is a cryptographically signed config file
listing the email and key fingerprint of everyone in the team:

![A screenshot of an example roster](/images/2019-03-26-release-1-0/roster-example.png)


### People in the team delegate trust to their admins

It's not practical for every team member to verify everyone else's key. (And web of trust is largely
irrelevant outside of very specific circles)

Instead, Fluidkeys uses the trusted-admin model. Team members delegate the task of verifying keys to
a team admin. Whatever email and key are listed in the team roster is considered the truth.


### Only team admins can update the roster

Only team admins can add people to the team. All updates to the roster are signed, and Fluidkeys
won't accept an update that wasn't signed. That means **only you** can add people to the team. Even
though we host your roster, we can't modify it.


### Keys in the roster are automatically fetched and trusted

Fluidkeys periodically checks and verifies updates to the roster. Any new keys are automatically
fetched and imported into GnuPG. The associated email address in the roster is trusted in GnuPG
using a non-exportable certification.

That means GnuPG _just works_ if you want to encrypt to that email address (or use any other
GnuPG-powered tool, like pass, Enigmail or GPGMail.)

No more emailing keys around the team and searching keyservers. Everyone that joins the team always
has up-to-date and trusted keys.

<p class="markdown__button-wrapper">
    <a class="button button--inverted" href="/download">Download now</a>
</p>

# Fluidkeys uses a stable, verifying server

Fluidkeys doesn't currently use the public keyserver network. We use our own verifying server which
protects against spoofed keys.

Fluidkeys server also handles the transfer of encrypted secrets, and hosts team rosters.


# Fluidkeys for teams is a subscription service


## Fluidkeys is free for individuals

Fluidkeys is free for individuals. You get automatic key rotation and you can send end-to-end
encrypted secrets to anyone in the world who uses Fluidkeys.


## Fluidkeys is more powerful in a team

Fluidkeys is better in a team: you'll get more value from its automatic key exchange and the way it
configures tools for use in the team.

For teams of 2, Fluidkeys is free. You can test drive Fluidkeys today with no limitations.

For teams of 3 or more, Fluidkeys is free for 30 days.

If you like it and want to carry on, we'll ask for a per-user, per-month [subscription
fee.](/pricing)


## We're incorporating as a non-profit

We have an honest business model where companies pay us for the service we provide.

We're in the process of incorporating as a UK non-profit. This compels us to put our social
objectives before profit.

Paying for a subscription to Fluidkeys ensures its development continues and supports our social
mission.


## Fluidkeys is open source

Fluidkeys command-line application and Fluidkeys server are AGPLv3. You can do whatever you like
with the code as long as you respect the licence.

We think being open source is a great way to keep ourselves honest. We hope you'll agree!


# Try Fluidkeys now

We'd love you to try out Fluidkeys and let us know how you get on.

[https://download.fluidkeys.com](https://download.fluidkeys.com)

Please get in touch: we're excited to hear from you :)

— Paul & Ian

[Email hello@fluidkeys.com](mailto:hello@fluidkeys.com)
