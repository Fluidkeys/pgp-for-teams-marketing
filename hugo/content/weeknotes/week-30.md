---
title: "Week 30: Request to join a team"
author: Ian Drysdale
open_graph_type: "article"
open_graph_image: "images/2019-03-01-invitation-copy.png"
date: 2019-03-01
---

_Recap_: Fluidkeys makes PGP simple for engineering teams. It helps you safeguard your source code and protect passwords, secrets and personal data.

## The short version

* Carrying on from last week when we made it possible for admins to create  new teams, we’ve now built `fk team join <uuid>` so members can request to join them! 👯‍♂️
* We're on a mission to build a future where companies respect their users! 🔮
* We’ve heard some nice things from people using Fluidkeys 🥰

It’s late, again. I’ll keep this short, again…

## People can now request to join a team
We’ve had a great week on the development front, it's really been humming along nicely this week.

We tweaked the way an admin sets up a team, to give them a boiler plate invite they can copy and paste into Slack or whatever to start getting other people signed up:

<pre class="terminal">
<span class="header"> Invite people to join the team                               </span>

── <span class="notice">Invitation to join Fluidkeys Ltd</span> ─────────────────────

Join Fluidkeys Ltd on Fluidkeys

I've created a team on Fluidkeys to make it simple for
us to share passwords and secrets securely.

Join now:

1. download Fluidkeys from https://download.fluidkeys.com

2. join the team by running:
> fk team join 01381ea0-38b5-4119-9e87-2b45bd319b46

───────────────────────────────────────────────────

👆 Copy the invitation above and send it to your team.
</pre>

Next up was making that `team join <uuid>` bit work… Which as of earlier today, we have! Phew.

## We’re on a mission! 🚀
We’re getting ready to incorporate which means we need to write our articles of association. As [Paul wrote last week](https://www.fluidkeys.com/weeknotes/week-28/), we’re going to be a non-profit, which means we have to write a social purpose.

We went back at watched Simon Sinek’s presentation where he suggests you [Start With Why](https://www.youtube.com/watch?v=IPYeCltXpxw). It’s a great talk and if you’ve got a spare five minutes I’d recommend you watch it!

This helped us answer the following:

Why are we doing this?<br />
**We believe companies should respect their users**

How?<br />
**We encourage that by making it simple to adopt technology and practices that protect personal information**

What are we doing?<br />
**We build beautifully simple security software for teams**

It’s got us thinking about how _we_ are working hard to respect _our_ users. We’re not happy with Mailchimp, for example, as [they don’t allow us to turn off tracking](https://twitter.com/Mailchimp/status/1096473332248137728). We’ll be migrating soon.

It also reminded me, we've been thinking about this stuff for a while now. I think a lot of [the work we did at the Co-op](https://dpr.coop.co.uk/) would have fit under this purpose too!

Having this mission and social objective pinned down brings us a step closer to incorporating!

## We’re getting some nice feedback
> It was great, we moved some keys around between machines really easily. Great stuff!

Having Fluidkeys out in the wild, and then hearing back from people using it telling us they found in really simple and slick has felt great.

## Next week

Next week we will:

* make it so team admins can authorise people trying to join their team
* incorporate?!

As ever, if you’ve got any thoughts or feedback, we’re all ears.

Have a lovely weekend,

— Ian

*All* feedback is welcome, pop us an email to
[hello@fluidkeys.com](mailto:hello@fluidkeys.com)
