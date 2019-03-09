---
date: 2018-08-31
title: Week 4, Sketching a command line interface
author: Ian Drysdale
---

Paul and I are building Fluidkeys, software that helps teams protect themselves with strong encryption.

## The short version

This week's been a short one. 🏝 Paul's on holiday. Meanwhile I've:

*   started sketching what a <strong>command line interface</strong> for Fluidkeys could look like for administrators and their team members
*   made keys generated with Fluidkeys expire in 60 days

## Prototyping a command line interface 📺

We're starting to build Fluidkeys by focusing on security conscious _developers_ and _sysadmins_. We think we can make something that helps them get their teams using strong encryption. Therefore our first release will be an application they'll run from the terminal. We imagine they'll use this to get setup, then start inviting other members of their team to install it.

Last week, [Paul introduced two personas](https://www.fluidkeys.com/blog/week-3/) that were helpful in sketching out how this could work at a high level.

While he's been off in France, I've taken this thinking a little further and began writing some example commands they could run and the accompanying output they'd receive. You can [take a look here](https://www.fluidkeys.com/cli-prototype/team).

<pre class="terminal">
<span class="prompt">➜</span>  <span class="directory">~</span> fk

<span>Start with a key locker</span>
====
In Fluidkeys, everything starts with a locker. This is the place you and others in your organisation place their keys for safe keeping.

Is your group already using Fluidkeys?

1. Find your Fluidkeys locker 🔎
2. Create a new locker ✨

[1/2] : <span class="directory">_</span>

Creating a new locker <span class="spinner">\</span>... <span class="positive">[done]</span>

We'll now store your key in the new locker and set you up as an adminsitrator

<span class="information">Found GnuPGP, would you like to import an existing key from there? </span> [Y/n] <span class="cursor">_</span>
</pre>

All of these are *very* early doodles, but I think we'll find them useful next week as we start to work up the interface for this release.

## Continuing to lay the foundation 🏗️

Meanwhile, we've also made keys generated using Fluidkeys expire in 60 days. Later we'll implement some sort of [key rotation](https://www.owasp.org/index.php/Key_Management_Cheat_Sheet#Key_Rotation), but I found getting this working useful for improving my understanding of how [Go's openpgp library](https://godoc.org/golang.org/x/crypto/openpgp) works. 🕵️‍♂️

Despite being on holiday, I've seen Paul is pushing the odd work in progress commit to git... He's been dabbling with making it so each time you generate a key with Fluidkeys you also automatically create a revocation certificate and this gets zipped as part of your backup.

We also opened a joint bank account in under 3 days. *Rapid*. Well done <a href="https://monzo.com/">Monzo</a>.

Thanks for reading.

— Ian

*All* feedback is welcome, pop us an email to [paul@paulfurley.com](mailto:paul@paulfurley.com) and [idrysdale@gmail.com](mailto:idrysdale@gmail.com)
