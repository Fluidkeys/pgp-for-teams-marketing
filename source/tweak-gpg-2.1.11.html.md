---
layout: singlepage
title: Enable pinentry mode 'loopback' on GnuPG 2.1.11
---
# Enable pinentry mode 'loopback' on GnuPG 2.1.11

Add this line to `~/.gnupg/gpg-agent.conf`:

```
allow-loopback-pinentry
```

Then restart `gpg-agent`:

```
$ gpgconf --reload gpg-agent
```

That's all 🙌

---

## Fluidkeys uses loopback mode to maintain keys automatically

Loopback mode allows Fluidkeys to send a password directly to GnuPG, rather
than GnuPG itself prompting for the password.

This lets Fluidkeys store the password in the system keyring, then run automatic maintenance from cron (see `fk key maintain automatic`)

Unfortunately GnuPG 2.1.11 throws an error if you try to use loopback mode:

```
gpg: setting pinentry mode 'loopback' failed: Not supported
```

This was [fixed in GnuPG 2.1.12](https://lists.gt.net/gnupg/devel/77927#77927), but if you're using Ubuntu 16.04 you're stuck with the affected version.
