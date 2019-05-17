---
date: 2018-12-14
title: "Week 19: Onboarding"
author: Paul Fawkesley
---
**Protecting liberty by simplifying security**

_Recap_: With Fluidkeys, you can send end-to-end encrypted secrets from the command-line, with all the power of OpenPGP and none of the hassle.

Using Fluidkeys reduces the impact of third-party data breaches, targeted spearphishing attacks and network compromise.

## The short version:

* We published an intermediate `0.2.6` release
* Licensed our code as AGPLv3
* Started designing the onboarding experience
* Mocked up a chatbot interface
* Took more calls

## Quietly released Fluidkeys 0.2.6

We were keen to put `fk secret send` into the world so people can try it out without having to build from source. After a lot of bug bashing and tweaking we released `0.2.6`, which is now available through the normal [install channels.](https://download.fluidkeys.com)

We only count `0.3`, `0.4` as *proper* releases so this doesn't count towards our [metrics](https://fluidkeys-dashboard.herokuapp.com), but it's good hygiene to keep releasing.

## Licensed our code as GNU Affero Public License v3

We think the AGPL is a good choice: it sends a strong signal that we're committed to software freedom, while giving us good options for building a service business model.

## Started designing the onboarding experience

For our upcoming `0.3` release we realised we need to be better at guiding new users. For people who aren't that familiar with PGP, it's not obvious what Fluidkeys *is*, and staring at `fk --help` doesn't answer that either.

We've been mocking up a few ways of onboarding new people: helping them to discover what Fluidkeys can do by creating a key and actually *doing* something with it.

Now that we've got `fk secret send` and `fk secret receive` we're designing the onboarding around that: some sort of bot you can interact with to show that it's working.

## Mocked up a chatbot interface

We felt it *might* work to use a chatbot type interface to get people started.

OK, take a deep breath, and take a look at this mockup:

![A cartoon squirrel with a chat bubble](/images/weeknotes/week-19/2018-12-17-secret-squirrel.png)

[Play with the live chatbot](https://landbot.io/u/H-112432-MJ5YDOCDSN1Y5SGH/index.html)

It was awesome that Ian was able to knock up the mockup in 20 minutes based on some rough docs we came up with.

Ultimately we felt that it comes across a little naff: even if it *is* a good medium, we can't help thinking about distasteful chatbots made by uncool supermarkets trying to enact their "millennial strategy".

Once we saw it in for real and talked it over, we felt it would be better todo onboarding *inside* Fluidkeys. So we've started work on `fk setup`, which will probably have a chattier feel than the rest of the application.

Until next week!

— Paul

*All* feedback is welcome, pop us an email to
[hello@fluidkeys.com](mailto:hello@fluidkeys.com)
