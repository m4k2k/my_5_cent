
# sudo session config

By default, a standard sudo session lasts for 5 minutes (on some distributions, e.g., Ubuntu, it is 15 minutes)

don't use `sudo su`

`Defaults        timestamp_timeout=10`

`
Defaults        mail_badpass
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
Defaults        timestamp_timeout=10

# Host alias specification
`

`sudo visudo`


# Error handling

## apt public key errors

### TLDR Try

```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6ED0E7B82643E131
```

### Encountered after running `sudo apt update`

```lang-none
Hit:4 https://download.docker.com/linux/raspbian buster InRelease
Err:1 http://deb.debian.org/debian buster-backports InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 0E98404D386FA1D9 NO_PUBKEY 6ED0E7B82643E131
W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://deb.debian.org/debian buster-backports InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 0E98404D386FA1D9 NO_PUBKEY 6ED0E7B82643E131
W: Failed to fetch http://deb.debian.org/debian/dists/buster-backports/InRelease  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 0E98404D386FA1D9 NO_PUBKEY 6ED0E7B82643E131
W: Some index files failed to download. They have been ignored, or old ones used instead.
```

Extract:

```lang-none
couldn't be verified because the public key is not available: NO_PUBKEY 0E98404D386FA1D9 NO_PUBKEY 6ED0E7B82643E131
```

&rarr; some keys are invalid

check for invalid keys:
`sudo apt-key list`

identified invalid/missing keys: `0E98404D386FA1D9` `6ED0E7B82643E131`

now update the key storage with the new keys

example:
`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9`
in this case the keyserver is powered by ubuntu
next run  `apt update` and `apt upgrade` to verify the key update was successful

following keyservers have also been useful for me (even though ubuntu is the only one needed for above hashes):

- `keyserver.ubuntu.com`
- `keys.gnupg.net`
- `keyring.debian.org`
