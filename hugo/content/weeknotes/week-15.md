---
date: 2018-11-16
title: "Week 15: Can you help intro us to infosec people?"
author: Ian Drysdale
---

**Protecting liberty by simplifying security**

*Recap*: We're building Fluidkeys to make it easy for teams to implement
great security across their organisations.

I'm on my own this week, Paul's on his hols...

## This week:

### 1. I went to DEFCON Sheffield ☠️

On Monday evening I went to a regular meetup here in Sheffield for people
interested in information security. Jonny Huxtable talked about some exploits
in Etheruem Smart Contracts that led to millions of dollars being lost.
It's crazy, the stakes are so high for bugs in code that's becoming a financial
institution!

Then Neil Richardson showed how simple it is to spoof SMS messages and how
phishing is evolving.

A great night, despite us being locked out of the first venue, and none of the
30 or so security nerds being able to break in!

### 2. I've been contacting people responsible for security in their companies ☎️

Some lovely responses to our week notes, with some sage advice. Thank you, it
means a lot when you take time to offer us some feedback. 🙏

The consensus is that it's almost impossible to be selling too early! So,
this week I've been reaching out to speak to various teams and organisations
trying to schedule meetings to learn more about their problems and see if we
can sell them something valuable.

This is where you can help, dear reader:

> **Please could you introduce me to someone working in information security or
> devops in either a finance company or a government department?**

> Tell that person that we've developed software that makes it super easy to
> implement PGP, and get great security practices going across the organisation.

### 3. I'm starting to build a webserver 👨‍💻

Besides that, I've also been experimenting with how to get the next part of the
puzzle working: syncing keys across teams. (A reminder: Fluidkeys currently
only maintains your individual keys)

I've built a small webserver, with a simple API, again all in Go. It's connected
to a Postgresql database, where we start to record teams, users and fingerprints.
It's fun working with HTTP again. I'm beginning to get somewhere, and hopefully
I'll have something show you next week!

That's it for this week, see you next Friday!

— Ian

*All* feedback is welcome, pop us an email to
[hello@fluidkeys.com](mailto:hello@fluidkeys.com)
