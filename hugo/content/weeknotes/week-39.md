---
title: "Week 38: Applying for funding and preparing for 1.1!"
author: Ian Drysdale
date: 2019-04-26
---

_Recap_: Fluidkeys makes PGP simple for engineering teams. It helps you safeguard your source code and protect passwords, secrets and personal data.

## The short version

* We applied to Open Tech Foundation's Internet Freedom Fund to develop Fluidkeys for Journalists! 📰
* We switched out `cron` for `launchd` to handle key rotation and team sync on macOS ♻️
* We made the whole team setup flow much smoother 🏄‍
* We changed how we do key rotation, extending it from monthly to annually 📆

## We applied for funding to develop Fluidkeys for Journalists

At the beginning of the week Paul and I worked with [Ela Stapley](https://twitter.com/elastapley) (a digital safety consultant and former freelance journalist) to develop a proposal to build a version of Fluidkeys for journalists!

We've submitted this idea to the Open Technology Foundation's [Internet Freedom Fund](https://www.opentech.fund/funds/internet-freedom-fund/).

> The Internet Freedom Fund supports projects and people working on open and accessible technology-centric projects that promote human rights, internet freedom, open societies, and help advance inclusive and safe access to global communications networks for at-risk users including journalists, human rights defenders, civil society activists, and every-day people living within repressive environments who wish to speak freely online.

While it's essential to improve the security practices of developer teams, we recognise we can only have so much impact. Journalists, activists and human rights workers are the front-line in the fight for our freedoms. We want to apply the same focused approach to remove the obstacles for journalists to secure themselves with PGP.

It's an expression of interest at this stage, so we'll wait and hear back if we're invited to put together a more detailed proposal! 🤞🏼

## We switched out `cron` for `launchd` to handle key roration and team sync on mac

`cron` wasn't playing very nicely with macOS. To cut a long story short, `cron` needed access to the user's keychain in order to rotate keys successfully and that didn't wasn't straightforward. So last week we made the decision to use `launchd` instead of `cron` to schedule the automatic key rotation and team syncing.

This week we got that working, and everythings looking 💯

## Team signup is now much smoother

We've applied some polish to the signup flow. When you request to join a team, it now waits, polling to see whether the administrator has approved you:

<img src="/images/weeknotes/week-39/waiting-spinner.gif" alt="An animated spinner waiting for approval" class="normal-width" />

As soon as you're approved Fluidkeys then goes and fetches all the keys for your team that instant.

Things like this are attempts to make the whole process a little smoother for people setting up teams.

## We changed how we do key rotation, extending it from monthly to annually

After extensive testing, we've realised the world isn't ready for fast-expiring PGP keys!
Previously, keys expired 30 days after 1st of next month but we've decided instead that they should expire in 1 year rounded to the next quarter (1st feb, may, august or november).

So with these changes, and [a bunch more](https://github.com/fluidkeys/fluidkeys/pulls?q=is%3Apr+is%3Aclosed) we're in good shape for releasing version 1.1 next week!

That's all for now, have a lovely bank holiday.

— Ian

_All_ feedback is welcome, pop us an email to [hello@fluidkeys.com](mailto:hello@fluidkeys.com)
