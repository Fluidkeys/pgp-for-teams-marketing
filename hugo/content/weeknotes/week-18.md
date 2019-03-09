---
date: 2018-12-07
title: "Week 18: Send secrets with Fluidkeys"
author: Paul Fawkesley
---
**Protecting liberty by simplifying security**

_Recap_: We're building Fluidkeys to make it easy for teams to implement great security across their organisations. We’ve built a command line app that helps you make strong PGP keys and automatically rotate them.

## The short version:

* Ian's been taking lots of calls
* You can send a secret through Fluidkeys

## Learning through listening

The [dashboard](https://fluidkeys-dashboard.herokuapp.com) Ian showed last week has put a fire under both of us: Ian's been chasing the numbers and madly arranging phone calls with people.

These are proving valuable: some are validating that what we're doing is useful, some are revealing whole new areas we aren't thinking about.

This routine of regular calls with potential customers is healthy: we had a dry patch while we were working on 0.2, and we were a little uncertain where to go with 0.3.

Since last week we're more confident that sharing secrets *is* useful. We're still excited about key management for teams, but that's bigger and less well-understood at the moment.

## Sending secrets through Fluidkeys

"43 days since last release" is looming heavy, and it's projected us firmly back into building territory.

Fluid 0.3 will let you send secrets to team mates. We've stripped it back to the simplest useful thing, and this week we've made huge leaps forward.

Today, you can send a secret to an email address:

<pre class="terminal">
<span class="prompt">➜</span> fk secret send paul@fluidkeys.com

[type or paste your message, ending by typing Ctrl-D]

<span class="information">SECRET_ACCESS_TOKEN="7d10c9b8-f48e-11e8-9b90-a74f356d2ad5"</span>

 <span class="positive">▸ Found public key for paul@fluidkeys.com</span>
 <span class="positive">▸ Successfully sent secret to paul@fluidkeys.com</span>
</pre>

Fluidkeys finds the public key, encrypts the message and sends it via our API. Then, the other person can receive it:

<pre class="terminal">
<span class="prompt">➜</span> fk secret receive

<span class="information">Downloading secrets...</span>

For paul@fluidkeys.com:

---
SECRET_ACCESS_TOKEN="7d10c9b8-f48e-11e8-9b90-a74f356d2ad5"
---
</pre>

We're getting there!

There's a bit to do still behind the scenes: we need to verify the link between email addresses and keys, and this isn't straightforward. I've been thinking about how to do "key discovery" safely and conveniently for a long time, so next week we should have something to show.

So today, you can send a secret (to me or Ian), but you can't receive one just yet.

If you're feeling brave, you could compile Fluidkeys' `master` branch and send us a secret message. Otherwise, hold tight, v0.3 won't be long :)

Until next week...

— Paul

*All* feedback is welcome, pop us an email to
[hello@fluidkeys.com](mailto:hello@fluidkeys.com)
