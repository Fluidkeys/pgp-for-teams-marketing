---
title: "How to remove crontab lines on macOS Mojave"
weight: 5
---

# How to remove crontab lines on macOS Mojave

Since v1.1 Fluidkeys no longer uses `cron` to schedule an hourly task to run in the background on macOS. Instead it uses `launchd`.

Fluidkeys will attempt to remove itself from cron, but may run into problems. This is due to Mojave restricting applications' ability to edit a user's crontab.

If Fluidkeys fails to remove itself, this doc shows you how to remove these leftover lines in cron.

<h2 class="numbered">Try to manually remove the lines using `crontab`</h2>

Open Terminal (or iTerm) and run `crontab -e`. This opens a text editor where you should see the following lines that schedule Fluidkeys to run every hour:

<pre>
[ ... ]
# Fluidkeys added the following line to keep you and your team's keys updated
# automatically with `fk sync`
# To configure this, edit your config file (see `ffk --help` for the location)
@hourly perl -e 'sleep int(rand(3600))' && /usr/local/bin/fk sync --cron-output
[ ... ]
</pre>

Delete these lines and save the file.

At this point, you may be prompted to allow Terminal to administor your computer, in which case click <strong>OK</strong>.

If you then see...

<pre class="terminal">crontab: installing new crontab
<span class="command"></span></pre>

... then success, you don't need to do anything else! 🙌

If you don't get that permissions prompt, and instead see something like this...

<pre class="terminal">
crontab: installing new crontab
crontab: tmp/tmp.73516: Operation not permitted
crontab: edits left in /tmp/crontab.DFDDqyAEX1
<span class="command"></span>
</pre>

Then that hasn't worked 😢 You'll have to temporarily grant permission... Read on.

<h2 class="numbered">Grant full-disk access to iTerm/Terminal</h2>

<ol>
    <li>
        <p>
        Open <strong>System Preferences</strong>, then <strong>Security & Privacy</strong> > <strong>Privacy</strong> and select <strong>Full Disk Access</strong>
        <img src="/images/docs/grant-permissions-on-mac-os-mojave/screenshot-full-disk-access-menu.png" class="normal-width" alt="A screenshot of the macOS Systems Preferences menu, with Security and Privacy highlighted" />
        </p>
    </li>
    <li>
        <p>Click the <strong>(+) icon</strong> to add an item to the list. You may have to unlock the panel to access this.</p>
    </li>
    <li>
        <p>In the search bar in the top right, type <code>iTerm</code> (or <code>Terminal</code> if you're using that instead). You should see it listed in the Finder window, like this:
        <img src="/images/docs/grant-permissions-on-mac-os-mojave/screenshot-select-iterm-in-finder.png" class="normal-width" alt="A screenshot of the macOS Systems Preferences menu, with Security and Privacy highlighted" />
        Select it, and click <strong>Open</strong>.</p>
        <p>(If you need to manually locate the files, <strong>iTerm</strong> is typically found in `Macintosh HD > Applications`, and <strong>Terminal</strong> is found in `Macintosh HD > Applications > Utilities`)</p>
    </li>
    <li class="markdown__index-item">
        You may be prompted that iTerm (or Terminal) will not have full disk access until it is quit. Click <strong>Quit now</strong>, and close all the windows.
    </li>
</ol>

<h2 class="numbered">Remove the leftover lines using `crontab`</h2>

Reopen <strong>iTerm</strong> or <strong>Terminal</strong> and run `crontab -e`.

Find the leftover Fluidkeys lines (shown below) and delete them and save the file.

<pre>
[ ... ]
# Fluidkeys added the following line to keep you and your team's keys updated
# automatically with `fk sync`
# To configure this, edit your config file (see `ffk --help` for the location)
@hourly perl -e 'sleep int(rand(3600))' && /usr/local/bin/fk sync --cron-output
[ ... ]
</pre>

You should be returned to the terminal, with a line reporting that the new crontab has been installed:

<pre class="terminal">crontab: installing new crontab
<span class="command"></span></pre>

Success, the lines have been removed! 😅

<h2 class="numbered">Revoke full-disk access to iTerm/Terminal</h2>
<ol>
    <li>
        <p>
        Again, open <strong>System Preferences</strong>, then <strong>Security & Privacy</strong> > <strong>Privacy</strong> and select <strong>Full Disk Access</strong>
        </p>
    </li>
    <li>
        <p>
        In the list of apps on the right, click on <strong>iTerm</strong> (or <strong>Terminal</strong> if you've been using that), then click the <strong>(-) icon</strong> to remove the app from the list.
        </p>
    </li>
</ol>

And you're done. The leftover lines are gone and the permissions are set back as they were.

Still having problems? Email [help@fluidkeys.com](mailto:help@fluidkeys.com) and we'll do our best to get you up and running.
