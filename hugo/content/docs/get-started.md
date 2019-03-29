# Getting started with Fluidkeys in your team
Fluidkeys is a command line application that gives your team PGP encryption superpowers. It makes it simple to share and store sensitive data, safeguard your source code and use popular open source PGP tools.

Fluidkeys automates key rotation and exchange amongst a team. This guide will get you setup as a team and each member of the team setup with new PGP keys.

<div class="callout callout--warning">
    <p>If you’re already using GnuPG with your team, and want to use these existing keys with Fluidkeys, check out How to import your existing keys GnuPG keys into Fluidkeys</p>
</div>

Contents:

1. Prerequisites: Install Fluidkeys
2. [Setup your team in Fluidkeys](#setup-team)
3. [Invite people to join](#invite-people)
4. [Authorize people’s requests to join](#authorize-requests)
5. [Keep the teams' keys in sync](#sync-keys)

---

<h2  class="numbered">Prerequisites: Install Fluidkeys</h2>

* [Fluidkeys installation instructions](www.fluidkeys.com/download)

<h2 id="setup-team" class="numbered">Set up your team</h2>

The `fk team create` command gets you started in creating a team in Fluidkeys. The first thing you’ll be asked is *what’s your team email address?*

<pre class="terminal">
<span class="command">fk team create</span>

<span class="header"> What's your team email address?</span>

<span class="output">This is how other people using Fluidkeys will find you.

We'll send you an email to verify your address.

[email] :</span>
</pre>

After providing your email address, Fluidkeys will present you with a strong six word password password. It’s save this in your system’s keyring so you don’t have to keep typing it and so that Fluidkeys can automate tasks like rotating your key each month.

<div class="warning">
    <p>It’s important to save a backup of this password. We recommend putting it into a password manager as a backup.</p>
</div>

<pre class="terminal">
<span class="header"> Store your password</span>

<span class="output">We've made you a strong password to protect your secrets:

🤫   <span class="information">mushroom.departure.backpack.dwelled.circling.figurine</span>

The password will be saved to your macOS Keychain so you don't have to keep
typing it.

<span class="notice">You should save a copy in your own password manager as a backup.</span>

Press enter when you've saved the password.</span>
</pre>

<div class="callout callout--info">
<p>
    Behind the scenes, Fluidkeys will generate you a PGP key and store this in GnuPG. The email address you provide will be associated with this key, and the password Fluidkeys provides will be used to protect this key. You can see this key in GnuPG by running <code>gpg --list-secret-keys</code>
</p>
</div>

Next Fluidkeys will check you’ve stored your password by wiping the screen and prompting you to repeat back one of the words. You’ll then be prompted to verify your email address.

Fluidkeys will then complete a number of tasks to create your key, before asking you for your team name:

<pre class="terminal">
<span class="output"><span class="header"> What's your team name?</span>

This is how your team will be displayed to you and other members. You can
always change this later.

[team name] :</span>
</pre>

Fluidkeys will then create a roster for the team which is a list of all the people in it. At this point, this will just be you. You’ll get a chance to preview it, before being prompted to sign it and upload it to our team server.

<div class="callout callout--info">
<p>Cryptographically signing the roster means your other team members can validate that you, and only you, have edited this file.</p>
</div>

Everyone in the team has a copy of this roster and it is used to lookup which key to use for an email address and fetch the corresponding keys.

<pre class="terminal">
<span class="output"><span class="header"> Creating signed team roster</span>

Create team roster with you in it:

── <span class="notice">Preview of roster.toml</span> ──────────────────────────────────────────────────
# Kiffix team roster. Everyone in the team has a copy of this file.
#
# It is used to look up which key to use for an email address and fetch keys
# automatically.
uuid = "e4959b34-ef41-4e2a-b3bd-fb2604c62c0e"
name = "Kiffix"

[[person]]
  email = "jane@kiffix.com"
  fingerprint = "4C83FCD3D404EBC41BE298C6129054800CDE2D77"
  is_admin = true
────────────────────────────────────────────────────────────────────────

Sign and upload the roster to Fluidkeys now? [y/n]</span>
</pre>

<h2 id="invite-people" class="numbered">Invite people to join your team</h2>

Once signed and uploaded, you’ll then be given an invitation you can share with your team members to join you:

<pre class="terminal">
<span class="output">── <span class="notice">Invitation to join Kiffix</span> ───────────────────────────────────────────────────
Join Kiffix on Fluidkeys

I've created a team on Fluidkeys to make it simple for us to share passwords
and secrets securely.

Join now:
1. download Fluidkeys from https://download.fluidkeys.com
2. apply to join the team by running:
> fk team apply e4959b34-ef41-4e2a-b3bd-fb2604c62c0e
3. reply to me with your verification details so I can authorize you
────────────────────────────────────────────────────────────────────────────────</span>
</pre>

When each of your team members runs `fk team apply ...` they’ll be guided through a similar set-up you did when creating the team: they’ll be asked what email address they want to use, be given a strong password. Finally they’ll be given a message to relay back to you to authorise their request to join the team.

It’ll look like this:

<pre class="terminal">
<span class="output">── <span class="notice">Please authorize me to join Kiffix</span> ──────────────────────────────────────────
I've requested to join Kiffix on Fluidkeys.

Here are my verification details:
» key:   F357 9950 9697 694A 66E0  A26D 953C B86F F357 B12D
  email: tina@example.com

Please can you authorize me by running
> fk team authorize
────────────────────────────────────────────────────────────────────────────────</span>
</pre>

### Resending invitations
If you lose this invitation at a future date, you can always get the invitation code by running `fk status`

<pre class="terminal">
<span class="output"><span class="information">│</span> ℹ️  <span class="information">Invite others to join Kiffix</span>
<span class="information">│</span>
<span class="information">│</span> Your team members can request to join the team by running
<span class="information">│</span> fk team apply e4959b34-ef41-4e2a-b3bd-fb2604c62c0e</span>
</pre>

<h2 id="authorize-requests" class="numbered">Authorizing requests</h2>
<h3 id="authorize-requests" class="numbered">Authorizing requests</h2>

Once various members of your team have applied to join your team, you’ll need to authorize them. You can do this with the `fk team authorize` command.

<pre class="terminal">
<span class="command">fk team authorize</span>
<span class="output">1 request to join Kiffix:

1. tina@example.com

» key:   F357 9950 9697 694A 66E0  A26D 953C B86F F357 B12D
  email: tina@example.com

Authorize tina@example.com now? (type n to decide later) [y/n]</span>
</pre>

It’s important to check that the key and email information you’re presented running this command for each request matches what your team member sent you:

![Comparing the key and email between an instant message and terminal](/images/docs/get-started--compare-fingerprints-email.png)

This is to ensure it really is them requesting to join the team, and not someone else trying to gain access!

<div class="callout callout--info">
<p>You can always postpone making a decision on whether to authorize someone or not, by typing <code>n</code>. You can also reject requests, which means the team member would have to apply again to gain access.</p>
</div>

Once you’ve finished authorising the requests, you’ll be prompted to sign and upload an updated roster.

<h2 id="sync-team" class="numbered">Keep your keys in sync</h2>

Once this team roster is uploaded to Fluidkeys you and your team members can run `fk team fetch` to download one another’s keys and import them into GnuPG.

By default, Fluidkeys does this for you each day in the background. That way you’ll know you always have the latest key for each person and that they rotate each month.

