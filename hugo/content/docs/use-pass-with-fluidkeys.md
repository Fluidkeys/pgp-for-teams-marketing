---
title: "Use pass in a team with Fluidkeys"
---

# Use pass in your team with Fluidkeys

Store shared team passwords and secrets in [pass](https://www.passwordstore.org/) with automatic syncing via git. Because Fluidkeys keeps team keys updated and signs them with GnuPG, it's easy to use pass for team shared passwords and secrets.

<pre class="terminal">
<span class="command">pass</span>
<span class="output">Password Store
├── office
│   └── wifi
└── jenkins
    └── github-webhook-token</span>
</pre>

For this example we'll be using Github and an imaginary team called `kiffix`.

<div class="callout callout--warning"><p>If you're already using pass for personal passwords, we suggest using a completely separate <code>~/.password-store</code> directory.</a></p></div>

Contents:

0. Prerequisites
1. [Setup a shared password repo](#setup-pass) for the team (just once)
2. [Subscribe team members to the password repo](#join-pass)
3. [Use pass day to day](#use-pass)

## Prerequisites

You'll need:

* [Fluidkeys](https://download.fluidkeys.com) >= 1.0
* A team set up in Fluidkeys (see `fk team create`)
* [pass](https://www.passwordstore.org/#download)

<a name="setup-pass"></a>

<h2 class="numbered">Set up a shared password repo for the team</h2>

<h3 class="numbered">Create the repo</h3>

Create new repo on e.g. [Github](https://github.com/new), [Bitbucket](#), [Gitlab.](#)

We call our repo [fluidkeys/pass](https://github.com/fluidkeys/pass) and it's public.

<h3 class="numbered">Get team emails from Fluidkeys</h3>

<div class="callout callout--info"><p>Future versions of Fluidkeys will automate these steps for your team. See our <a href="/#roadmap">public roadmap.</a></p></div>

Extract the team's emails from your signed team roster so pass knows who to encrypt to:

<pre class="terminal">
<span class="command">TEAM_EMAILS=$(cat ~/.config/fluidkeys/teams/*/roster.toml | grep email | cut -d'"' -f2)</span>
<span class="command">echo "setting up pass for $TEAM_EMAILS"</span>
setting up pass for tina@kiffix.com, chat@kiffix.com, mark@kiffix.com
</pre>

<h3 class="numbered">Initialize pass directory `~/.password-store`</h3>

<pre class="terminal">
<span class="command">pass init ${TEAM_EMAILS}</span>
<span class="output">mkdir: created directory '/home/paul/.password-store'
Password store initialized for tina@kiffix.com, chat@kiffix.com, mark@kiffix.com</span>
</pre>

<h3 class="numbered">Convert pass directory into a git repo</h3>

<pre class="terminal">
<span class="command">pass git init</span>
<span class="output"Initialised empty Git repository in /home/paul/.password-store/.git/</span>
</pre>

<h3 class="numbered">Set the git remote</h3>

<pre class="terminal">
<span class="command">pass git remote add origin git@github.com:kiffix/pass.git</span>
</pre>

<h3 class="numbered">Automatically push changes to the repo</h3>

Edit `~/.password-store/.git/hooks/post-commit` and add these lines:

```
#!/bin/sh -x

git push origin master:master
```

Make `post-commit` executable:

<pre class="terminal">
chmod +x ~/.password-store/.git/hooks/post-commit
</pre>

<h3 class="numbered">Test everything's working</h3>

So far, so good. Let's make sure we can encrypt and decrypt passwords. Try adding a password with `pass insert`:

<pre class="terminal">
<span class="command">pass insert office/wifi</span>
<span class="output">Enter password for test/test:
Retype password for test/test:
+ git push origin master:master
Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 1.56 KiB | 798.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To github.com:kiffix/pass
   e459005..31d83cb  master -> master
[master 31d83cb] Add given password for office/wifi to store.
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 wifi.gpg</span>
</pre>

The password has been encrypted, committed to git and pushed to the remote repo.

Now read it back with `pass`:

<pre class="terminal">
<span class="command">pass office/wifi</span>
<span class="output">dividable.county.smuggling.movable.oaf.afternoon</span>
</pre>

That's it! You've set up pass for shared passwords. These will be automatically pushed to Github
when they're updated.

Next, let's set up other team members.

---

<a name="join-pass"></a>
<h2 class="numbered">Subscribe team members to the password repo</h2>

When someone joins the team, set up their machine to use the shared password repo:

<h3 class="numbered">Clone the repo into `~/.password-store`</h3>

<pre class="terminal">
<span class="command">git clone git@github.com:fluidkeys/pass.git ~/.password-store</span>
Cloning into '~/.password-store'...
remote: Enumerating objects: 26, done.
remote: Counting objects: 100% (26/26), done.
remote: Compressing objects: 100% (22/22), done.
remote: Total 26 (delta 4), reused 23 (delta 1), pack-reused 0
Receiving objects: 100% (26/26), 11.57 KiB | 5.78 MiB/s, done.
Resolving deltas: 100% (4/4), done.
</pre>

<h3 class="numbered">Automatically push changes to the repo</h3>

Edit `~/.password-store/.git/hooks/post-commit` and add these lines:

```
#!/bin/sh -x

git push origin master:master
```

Make `post-commit` executable:

<pre class="terminal">
<span class="command">chmod +x ~/.password-store/.git/hooks/post-commit</span>
</pre>

That's it! Now you and your team can share passwords, automatically synced using git.

---

<a name="use-pass"></a>
<h2 class="numbered">Use pass day-to-day</h2>

Here are some helpful commands to get you started.

### List all passwords

<pre class="terminal">
<span class="command">pass</span>
<span class="output">Password Store
├── office
│   └── wifi
└── jenkins
    └── github-webhook-token</span>
</pre>

You can see the corresponding file structure by looking in `~/.password-store`.

### Add a password with `pass insert`

<pre class="terminal">
<span class="command">pass insert office/wifi</span>
<span class="output">Enter password for test/test:</span>
</pre>

### Add a text file with `pass insert --multiline`

<pre class="terminal">
<span class="command">pass insert --multiline</span>
<span class="output">Enter contents of test/multiline and press Ctrl+D when finished:

1c626a86-5181-11e9-a4c2-77d3a1368a19
# ^^ this is the access token for foobar

# you can use multi-line passwords to add comments like this one.
# we also use them to store PGP key backups and certificates
</span>
</pre>

Like all passwords in `pass`, it's a flat file with no schema (a *normal* password is just a file
with only 1 line).

### Echo a password to terminal

<pre class="terminal">
<span class="command">pass office/wifi</span>
<span class="output">dividable.county.smuggling.movable.oaf.afternoon</span>
</pre>

### Copy a password to clipboard with `pass -c`

<pre class="terminal">
<span class="command">pass -c office/wifi</span>
<span class="output">Copied office/wifi to clipboard. Will clear in 45 seconds.</span>
</pre>

For multiline files, `pass` just copies the first line.

### Fetch updated passwords with `pass git pull`

<pre class="terminal">
<span class="command">pass git pull</span>
<span class="output">Already up-to-date.
Current branch master is up-to-date.</span>
</pre>

You might need to [configure the branch](#no-tracking-information) if you see an error about `no tracking information`.

### Edit a password or text file with `pass edit`

<pre class="terminal">
<span class="command">pass edit office/wifi</span>
</pre>

That's it!

For more docs, extensions, GUIs and compatible clients, [visit
passwordstore.org](https://www.passwordstore.org/)

---

## Troubleshooting

### no tracking information for the current branch
<a name="no-tracking-information" ></a>

If you see this (familiar) error:

```
There is no tracking information for the current branch.
Please specify which branch you want to merge with.
See git-pull(1) for details.
```

Fix it with `git branch`

<pre class="terminal">
<span class="command">pass git branch --set-upstream-to=origin/master master</span>
</pre>
