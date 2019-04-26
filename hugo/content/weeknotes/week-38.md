---
title: "Week 38: Reminding people and writing docs 📚"
author: Ian Drysdale
date: 2019-04-26
---

_Recap_: Fluidkeys makes PGP simple for engineering teams. It helps you safeguard your source code and protect passwords, secrets and personal data.

## The short version

* We now automatically remind people who's keys are expiring in Fluidkeys ⌛
* We've written some documentation to help out the teams testing it out 📚
* We've planned for releasing v1.1 🗺

## We now remind people who's keys are expiring in Fluidkeys

In our desire to get v1 out the door, we'd neglected a little how Fluidkeys runs in the background. Each day it trys to run a task that checks if the key you made needs to be updated and extended, but we knew this wasn't always working quite right, particularly on macOS.

To address this before it becomes a problem, we wanted to warn everyone who had made a key, but hadn't got key maintenance working properly. We needed to let them know their keys would expire and what they could do about it!

Paul's been beavering away the past couple of days, and from the pull requests I see him opening, it looks like he's got it all working! 🙌

So not only will they all hear tomorrow, this'll also happen automatically from now on.

It also means we've laid the groundwork for sending more helpful, automatic emails like this from Fluidkeys in the future.

Alongside warning people, I've been researching how we can use [launchd](https://en.wikipedia.org/wiki/Launchd) rather than cron to schedule key maintenance on mac. We'll get this into our next release, which will make this automated stuff so much more reliable, but more on that next week.

## We've been documenting Fluidkeys

On Tuesday I pulled together an [index page](https://www.fluidkeys.com/docs/) for the documentation we've been writing about Fluidkeys. It's great getting this published!

I've enjoyed how writing docs have enabled us to deliver real minimum viable 'features'! For example: deleting a team. In the future, we know that we need to build a command like `fk team delete`, but in the meantime, instead of having zilch, we can spend an hour or so writing and publishing [how to delete a team](https://www.fluidkeys.com/docs/delete-a-team/). Tada, people can now delete teams!

## We've mapped out what we need to get into 1.1

Lastly, we've got our shop in order by writing out a bunch of Trello cards for the next release. If you're curious what we're doing, you can check them out on our [public roadmap](https://trello.com/b/dB9j4JaG/fluidkeys?menu=filter&filter=label:1.1%20team%20usability)!

## Next week

Next week we'll be doing as many of those cards as we can in preperation for releasing v1.1 on May 7th. Blimey, it's nearly May already!

That's all for now, see you soon.

— Ian

_All_ feedback is welcome, pop us an email to [hello@fluidkeys.com](mailto:hello@fluidkeys.com)
