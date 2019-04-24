---
title: "Deleting a team in Fluidkeys"
description: "Fluidkeys automates key rotation and exchange amongst a team. This guide will get you setup as a team and each member of the team setup with new PGP keys."
---

# Deleting a team in Fluidkeys

<h2 class="numbered">Change into the teams directory</h2>

`cd` into the teams directory and check for the team subdirectory:

<pre class="terminal">
<span class="command">cd $HOME/.config/fluidkeys/teams</span>
<span class="command">tree<span>
<span class="output">.
└── kiffix-5ad2176d-1980-41d2-b708-8f99202c409a
    ├── roster.toml
    └── roster.toml.asc

1 directory, 2 files</span>
</pre>

You should see one directory listed for the team, containing the `roster.toml` and signature `roster.toml.asc` as above.

<h2 class="numbered">Email us to delete the team from the server</h2>

Email [help@fluidkeys.com](mailto:help@fluidkeys.com) with the name of the team and the UUID (`kiffix-5ad2176d-1980-41d2-b708-8f99202c409a` in the example above) and we'll delete the team from the server.

<h2 class="numbered">Delete the team locally</h2>

Delete the directory that stores the team's <code>roster.toml</code>:

<pre class="terminal">
<span class="command">rm -r $HOME/.config/fluidkeys/teams/&lt;YOUR-TEAM-DIRECTORY&gt;</span>
</pre>

You can confirm this has worked by running `fk status`. You should see a warning alerting you to the fact you're no longer in a team. Success!

<h2 class="numbered">Tell everyone else to delete this team directory</h2>

<div class="callout callout--warning">
    <p>Everyone on the team will have to delete the team directory to join another team</p>
</div>

Tell them to run:
<pre class="terminal">
<span class="command">rm -r $HOME/.config/fluidkeys/teams/&lt;YOUR-TEAM-DIRECTORY&gt;</span>
</pre>

That's it, you're done.
