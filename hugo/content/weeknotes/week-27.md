---
date: 2019-02-08
title: "Week 27: Looking ahead"
author: Paul Fawkesley
---
**Protecting liberty by simplifying security**

_Recap_: We’re building Fluidkeys to help teams safeguard their source code and protect sensitive data.

## The short version

* Now you can send secret files
* We shut down the PGP keyserver monitoring service
* We're thinking about incorporating a social enterprise
* We're going to the Internet Freedom Festival

## Now you can send secret files

We had some quality feedback from our [last release: send encrypted secrets](/blog/release-0-3-send-encrypted-secrets/)
and we decided it was worth prioritising over team management for a week. We've committed to another
release on Tuesday, then we'll focus 100% on team management.

With 0.3 you can send secrets by typing (or piping) them into stdin. But some secrets are
fundamentally files, and their filenames matters, for example a TLS certificate.

Everything's the same under the hood, but now you can send files too:

<pre class="terminal">
<span class="prompt">></span> $ fk secret send /tmp/credentials.sh --to paul@fluidkeys.com
 ▸   Found public key for paul@fluidkeys.com
---
#!/bin/sh

export SMTP_USERNAME="hufdshfudasfdas"
export SMTP_PASSWORD="4w8xbTR]]N]kQK5YSsYBQcYPy8ch]]UsH9i7eYaX"
---

Send /tmp/credentials.sh? [Y/n]
</pre>

## We shut down the PGP keyserver monitoring service

This was a little sad but mostly a relief. We run a free service that monitors the public keyserver
network for new keys with your email address. It's been too stressful and time-consuming to run any more.

It was good planning how to close it respectfully and plan to delete people's data. I'm happy that
we [got some thanks for that:](https://twitter.com/thedarktangent/status/1093828559662018561)

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Thank you for running it, and thinking through how to end it gracefully. <a href="https://t.co/JBmlXX6qpC">https://t.co/JBmlXX6qpC</a></p>&mdash; The Dark Tangent (@thedarktangent) <a href="https://twitter.com/thedarktangent/status/1093828559662018561?ref_src=twsrc%5Etfw">February 8, 2019</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


[Here's my blog post.](https://www.paulfurley.com/shutting-down-keyserver-email-address-monitoring/)


## We're thinking about incorporating a social enterprise

With actual revenue on the horizon we're thinking about how to incorporate Fluidkeys.

Our ambition is to build a small, sustainable company with an honest business
model: sell something of value to customers. Naturally we've been considering
some sort of social enterprise.

We had a very instructive preliminary chat with an advisor about what kind of
enterprise we should be based on our goals, what control we want, how we want
to appear to the world, that sort of thing.

## We're going to the Internet Freedom Festival

We're thrilled and privileged to be going to the [Internet Freedom
Festival](https://internetfreedomfestival.org/) again. Tickets are limited
these days, so I feel lucky that we're able to go. We won't waste it!

We're running a developer meetup and we'll be showing off Fluidkeys at the
tools showcase on Thursday evening.

## Next week

Our goal for next week is to release 0.4 (send secret files) and be using a
teams MVP ourselves... busy times!

— Paul

*All* feedback is welcome, pop us an email to
[hello@fluidkeys.com](mailto:hello@fluidkeys.com)
