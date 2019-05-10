---
title: "Week 40: Released 1.1"
author: Paul Fawkesley
date: 2019-05-10
---

_Recap_: Fluidkeys makes PGP simple for engineering teams. It helps you safeguard your source code and protect passwords, secrets and personal data.

## The short version

* We released v1.1 to improve usability and reliability
* We made it possible to modify a team

## We released v1.1 to improve usability and reliability

This week's main news was that we
[released v1.1.](https://www.fluidkeys.com/blog/release-1.1-more-usable-more-reliable/)

This release solves a few headaches we've been having on macOS, and makes it much smoother to set
up a team.

Thanks to those teams who are trialling Fluidkeys, giving us great feedback, and staying patient!

## We made it possible to modify a team

Fingers crossed, by the end of the day we'll have finished `fk team edit`. This allows teams to
remove people and promote and demote team members as administrators.

Reminder: teams in Fluidkeys are defined by a cryptographically signed file. Only a team admin can
change the team, not even we can do that. This is excellent for security, but the flipside is that
it takes a little longer to build this stuff than writing a simple database query.

## Next week: `pass` MVP

Our next release (18th June) will support `pass` and `git-crypt`, making those tools easier to set
up and use with your team.

[Pass](https://www.passwordstore.org/) is an open source password manager. You
[can already use it with Fluidkeys](https://www.fluidkeys.com/docs/use-pass-with-fluidkeys/)
but each person has to do some manual steps.

Next week we'll build the first version of Fluidkeys that starts to work with pass.


— Paul

_All_ feedback is welcome, pop us an email to [hello@fluidkeys.com](mailto:hello@fluidkeys.com)
