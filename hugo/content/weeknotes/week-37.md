---
title: "Week 37: Automating our onboarding"
author: Paul Fawkesley
date: 2019-04-18
---

_Recap_: Fluidkeys makes PGP simple for engineering teams. It helps you safeguard your source code and protect passwords, secrets and personal data.

## The short version

* We gave a demo to the BSI
* We've been automating our onboarding
* We made some funding and product plans

## We gave a demo to the BSI

The [Bundesamt für Sicherheit in der Informationstechnik (German Federal Office for Information Security)](https://www.bsi.bund.de) kindly invited us to demo Fluidkeys this week.

We dialled in via Zoom to their offices in Germany (an experiment for both of us!) and demonstrated 3
ways that Fluidkeys simplifies PGP for teams. There were some great questions afterwards and good
feedback.

We're grateful for their ongoing kindness and moral support!

## We've been automating our onboarding

When people install Fluidkeys, there are certain things we'd like to see happen, for example enabling
automatic key extending, sending a secret, creating a team.

If those things don't happen, we'd like to gently point people in the right direction by email.
This is also a great way of finding out if anything went wrong, or if the person has any questions.

Much of this week was laying the groundwork for automating sending these emails.

## We made some funding and product plans

Just now we put together a list of potential funding organisations who might be able to help bridge our
funding gap in August. I've learned a lot about who's out there and some of the awesome projects
they've funded. We've decided to do "funding mondays" where we spend half a day working on funding
research and applications. If you know any organisations interested in any of these areas, we'd love
to hear from you:

* Reducing data breaches and the erosion of privacy
* Improving the open source encryption ecosystem
* Catalysing change across the technology industry by building tools that embed privacy by design
* Fluidkeys for journalists: making strong encryption simple for journalists

We also planned the next few weeks on product: we're going to add some telemetry to Fluidkeys
so we know exactly what's working and what's not. We've found an issue in the way macOS mojave
allows background access to the Keychain (for storing passwords) which affects Fluidkeys' ability
to run automatically. With telemetry we'll be able to measure that and help people fix it before it
becomes a problem.

## Next week

Next week we'll implement automatic expiry emails so anyone whose Fluidkeys' is not running correctly
in the background will get instructions to remedy the issue before it becomes a problem.

That’s it for now. Happy Easter!

— Paul

/All/ feedback is welcome, pop us an email to [hello@fluidkeys.com](mailto:hello@fluidkeys.com)


