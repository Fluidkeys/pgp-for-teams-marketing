---
date: 2018-10-19
title: Week 11, Automation 🤖
author: Ian Drysdale
---

*Recap*: we're building a tool that makes it easy for software teams to
implement great security across their organisations. We’re currently coding a
command line application that'll be a foundation for further functionality.

## This week

Paul’s off to the [OpenPGP Email Summit](https://blog.mailfence.com/openpgp-email-summit/)
in Brussels this weekend and racing to get his plane! ✈️ Sadly for you, this
means you’ve got me on week notes again! I’ll keep it short.

*This week has all been about getting Fluidkeys to do things automatically for you* 🤖

We’ve had key rotation working for a couple of weeks now, but each time you did
it the application would need to prompt you. This was either to check that
you were happy with what it was about to do, or for a password
(so as to be able to edit your keys).

All this is now a thing of the past.

Fluidkeys now allows you to store your key passwords safely in your operating
system’s keychain. You specify which of your keys you want to rotate
automatically and it’ll schedule a [Cron](https://en.wikipedia.org/wiki/Cron)
task and take care of the rest! 🏖

Hmmmm, how do I show the thing? How about the `config.toml` file?

<pre class="terminal">
<span class="comment"># Fluidkeys configuration file for 'fk' command</span>
run_from_cron = true

[pgpkeys]
  [pgpkeys.0CE71C96A2E08215ECD9F85C5FC2686F65FA1ABC]
    store_password = true
    rotate_automatically = true
</pre>

0.2 should be out next week and we’ll be looking for testers!

See you then!

Ian

*All* feedback is welcome, pop us an email to
[hello@fluidkeys.com](mailto:hello@fluidkeys.com)
