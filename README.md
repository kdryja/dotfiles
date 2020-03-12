# Intro

In this repo find a collection of all my dotfiles.

Currently, the repo is divided onto 3 branches:

- `master` - containing shared configs
- `workstation` - specific configs for my PC tower which is running x11 with i3 (cause nvidia is stupid)
- `laptop` - specific configs for my X1C6 laptop with Wayland and Sway

Then, I use `stow` to symlink all those configs to my home directory. That is, `stow ./ -t ~/`.

## Making changes

When I want to make any changes (e.g. add extra plugin to my `init.vim`), I'll simply change it as usual and then depending on the nature of the change (is it for specific to the current machine or can be shared across all computers?), either push it to `master` or specific branch.

## Updating

To pull changes that I might have done on master (while remaining on specific branch), run `git pull --rebase origin master`
