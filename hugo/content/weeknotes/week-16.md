---
date: 2018-11-23
title: "Week 16: Getting started with teams"
author: Ian Drysdale
---
**Protecting liberty by simplifying security**

_Recap_: We're building Fluidkeys to make it easy for teams to implement great security across their organisations. We’ve built a command line app that helps you make strong PGP keys and automatically rotate them. We been speaking with teams who are using PGP in their organisations and planning for trials.

Inspired by [Cassie Robinson](https://medium.com/@cassierobinson)'s weeknotes, this week I'm going to tell you what I've been doing, what I've learnt and what I'm celebrating.

## What I've been doing...

I've been on my own again this week as Paul's on holiday. It's been a peaceful and productive. I've spent a lot of it with my head down [coding](https://github.com/fluidkeys) wrangling with Go and JSON. I also spoke to two people working in organisations that are using PGP and organising to speak to others. (Thanks to those of you that have put me in touch with others! 🙏)

## What I’ve learnt…
Interesting how the two people I spoke to had quite different needs: for one, it’d be massively useful for them to simplify the way they onboard people and keep all their keys in sync. For the other, this wouldn’t be enough and they’d need a way to also send secret ‘snippets’ to colleagues.

I’ve learnt that I’m still unsure as to whether shipping something that simply improves the setup and administration of PGP is useful enough as a product in and of itself. That said, we’re nearly ready to release this, so we can experiment with finding a market for that while we build additional features on this foundation.

## What I’m celebrating…
I’ve got a ‘team-server’ working… almost.

Check it out!

<pre class="terminal" style="font-size: 0.9em;">
<span class="prompt">➜</span>  <span class="directory">~</span> fk team create Flextech

What’s your Flextech email address?

[email] : joan@flextech.com

You should use a separate key for each team.

1.  A55F 8AD9 EA17 A097 CB6C  AE49 A46A 7A39 9252 036A
    Created on 23 November 2018
      joan@flextech.com

Use this key for Flextech? [Y/n] Y

<span class="positive"> ▸   Successfully connected key to Fluidkeys
 ▸   Successfully created Flextechteam</span>

Edit and send the invite below to your team:

---
  Hello! Come and join our Flextech team on Fluidkeys
  Download Fluidkeys from download.fluidkeys.com then run:
  > fk team join aeab4301-3084-4156-bf97-bbaa9d17cf3a
---

You’ll need to approve new team members by running:

> fk team approve

<span class="prompt">➜</span>  <span class="directory">~</span>
</pre>

I say almost as I've not quite finished wiring up the approval command, but the rest is there. People can create new teams, then team members can request to join those teams.

It's worth celebrating as I've really enjoyed having a chance to write a webserver in Go. I've also enjoyed taking time over the code such that I hope it's easy enough for Paul to jump in when he gets back next week.

Until then!

— Ian

*All* feedback is welcome, pop us an email to
[hello@fluidkeys.com](mailto:hello@fluidkeys.com)
