---
date: 2018-09-28
title: Week 8, We've got key rotation working!
author: Ian Drysdale
---

We've got key rotation working! When you run `fk key rotate` Fluidkeys now goes off and checks your PGP keys. If you’ve got one set to expire years in the future, or one that is imminently expiring, it’ll helpfully offer to update them. In doing so it sets them to be valid until the end of next month. The gist of it is that doing this regularly means you end up using encryption keys that rotate every month. Nice and secure.

“Roll VT”

<div class="terminal-wrapper">
  <img class="my-class" src="/images/fk-0.1.5-rotate-demo.svg" alt="a screen recording of `fk key rotate` in action">
</div>

A couple of weeks back we got this short and helpful bit of feedback:

> I don't want to have to do anything.
>
> Can't it just rotate it for me?

Yes, absolutely! Next up we'll focus on making all this magic happen in the background.

That’s it for this week.

Despite [Ryanair's best efforts](https://www.bbc.co.uk/news/business-45667370), I'm off to Portugal for a week. So we'll both hear from Paul next time to see what he gets up to.

See you in a fortnight.

— Ian

*All* feedback is welcome, pop us an email to [hello@fluidkeys.com](mailto:hello@fluidkeys.com)

P.S. Paul and I are hosting a [digital self defence class](https://www.eventbrite.co.uk/e/digital-self-defence-reduce-your-facebook-footprint-tickets-50366286920) on October 9th in Liverpool. Come and learn how to reduce your Facebook footprint! 🙅🏽‍♀️
