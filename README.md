# Dotfiles

This repo is meant for all things configured with dotfiles in Linux.
Clone this into your home directory.
It is recommended to clone it as a hidden directory as such:
```bash
git clone https://github.com/PhilippGagel/dotfiles/ ~/.dotfiles
```

## Prerequisites

Install the following programs:
- git
- stow

## Set up

Call `./setup.sh`
In case stow throws an error that some files already exist, make sure the already existing files do not contain important info and then delete them.

## Tear down

**!CAREFUL!**
This can brick certain programs, and is meant for a hard reset.

Call `./teardown.sh`
