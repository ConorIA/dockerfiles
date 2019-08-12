# gpgit

This image is based on [tomav/docker-mailserver](https://github.com/tomav/docker-mailserver) and adds [gpgit](https://gitlab.com/mikecardwell/gpgit) to automatically encrypt incoming emails. Eventually, I would hope that this can be integrated into tomav/docker-mailserver. For now it is here for others who want to give it a shot.

## Keys

Add any keys that you wish to encrypt for under keys. Keys should be identified by their 8-digit key id, and the extension `.pub` for public keys and `.pvt` for private keys. If you wish to sign the encrypted messages, add a private key and set the following build-time arguments:

  - `SIGNING_KEY` ... the key to use to sign encrypted messages.
  - `PASSPHRASE` ... the passphrase for the `SIGNING_KEY`
