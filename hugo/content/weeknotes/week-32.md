---
title: "Week 32: Admins can authorise people to join a team"
author: Ian Drysdale
date: 2019-03-15
---

_Recap_: Fluidkeys makes PGP simple for engineering teams. It helps you safeguard your source code and protect passwords, secrets and personal data.

## The short version
* team administrators can now authorise people to join their team ✍️
* people who’ve had their requests approved can now sync keys with the rest of the team.

That was close, we _almost_ achieved our weekly goal. We’ve got`team join` and  `authorize` working, with a tiny bit more to do on `sync`.

We’re counting the days until we release version one. 11 to go!

## People can (almost) join teams
It’s felt like we’ve been working on this for a while, but each week when we get into the nuts and
bolts, without fail it presents itself to be more complicated that we originally anticipated.

This week has been a bit slower due to the fact that we store the team roster on the API, but also on everyone’s local machines (which means it could fail trying to write to disk) and that the roster is only valid if it has a cryptographically signed signature. It’s a lot to keep to track of, and validate at various stages of the whole process.

That said, it was really productive week. We’re tantalisingly close! 👇

<script id="asciicast-MXqAo7z8dPqhRulhCiq445vQ0" src="https://asciinema.org/a/MXqAo7z8dPqhRulhCiq445vQ0.js" async></script>

## Next week

Next week we'll finish the first version of Fluidkeys, ready for release and prepare to go on
[FLOSS weekly](https://twit.tv/shows/floss-weekly)!

As ever, if you’ve got any thoughts or feedback, we’re all ears.

Have a great weekend,

— Ian

*All* feedback is welcome, pop us an email to
[hello@fluidkeys.com](mailto:hello@fluidkeys.com)

