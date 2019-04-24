---
title: "How to grant permissions on macOS Mojave to run background tasks"
weight: 5
---

# How to grant permissions on macOS Mojave to run background tasks

Fluidkeys uses `cron` to schedule an hourly task that runs in the background. The task is called `fk sync` and attempts to do two things:

1. It checks if your key is overdue for extension. If it is, Fluidkeys creates a new sub key and extends the primary key.
2. It checks whether there are any changes to the team roster. If there are, it then fetches any new public keys.

Whenever you manually run `fk` it automatically attempts to schedule this task in `cron`, therefore it will have attempted to do this when you first install Fluidkeys, too.

<h2 class="numbered">Test that `fk sync` isn't already scheduled</h2>

Run `fk status`, you should see a warning that starts like this:

<pre class="terminal">
<span class="command">fk status</span>

<span class="error">│</span> 🔥 Failed to schedule automatic key maintenance and rotation</span>
<span class="output">...</span>
</pre>

If you don't see that error, but see a message like this...

<pre class="terminal">
<span class="command">fk status</span>
 <span class="information">▸</span>   Added Fluidkeys to crontab.  Edit /Users/jayne/.config/fluidkeys/config.toml to remove.
</pre>

... then success, you don't need to do anything else! 🙌

For the rest of you seeing that error above, read on...

<h2 class="numbered">Try to schedule `fk sync` in `cron` manually</h2>

The warning provides you with instructions on how to manually scheulde the task. Do this next.

Run `crontab -e` and add the following lines:

<pre>
# Fluidkeys added the following line to keep you and your team's keys updated
# automatically with `fk sync`
# To configure this, edit your config file (see `ffk --help` for the location)
@hourly perl -e 'sleep int(rand(3600))' && /usr/local/bin/fk sync --cron-output
</pre>

You may hit another error when attempted to save the file, again due to permissions. It would look like this:

<pre class="terminal">
<span class="command">crontab -e</span>
<span class="output">crontab: installing new crontab
crontab: tmp/tmp.64365: Operation not permitted
crontab: edits left in /tmp/crontab.vd6aCcGkgl</span>
</pre>

If this happens, the next step is to grant full disk access to Terminal or iTerm.

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

<h2 class="numbered">Test that Fluidkeys can now be scheduled</h2>

Reopen <strong>iTerm</strong> or <strong>Terminal</strong> and run `fk status`. You should now see the following:

<pre class="terminal">
<span class="command">fk status</span>
 <span class="information">▸</span>   Added Fluidkeys to crontab.  Edit /Users/jayne/.config/fluidkeys/config.toml to remove.
</pre>

Success! 😅

Still having problems? Email [help@fluidkeys.com](mailto:help@fluidkeys.com) and we'll do our best to get you up and running.
