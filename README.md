# dotfiles

Includes configurations for:

- neovim
- kitty
- zsh
- lazydocker

## Quick Start

```bash
# install homebrew and stow if needed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install stow

# clone the repo
git clone https://github.com/cqvo/dotfiles.git ~/.dotfiles

# stow the dotfiles
cd ~/.dotfiles
stow .
```

## How stow works

[GNU Stow](https://www.gnu.org/software/stow/) is a symlink manager. The repo
mirrors the layout of your home directory, so running `stow .` from the repo
root creates a symlink in `~` for every tracked file, pointing back into the
repo. For example:

```
~/.zshrc                  ->  ~/.dotfiles/.zshrc
~/.config/kitty/kitty.conf ->  ~/.dotfiles/.config/kitty/kitty.conf
```

This keeps every config tracked in one git repo while the apps that read them
see normal files at their expected paths. The files listed in
`.stow-local-ignore` (e.g. `README.md`, `brew.sh`, `.git`) are _not_ symlinked.

## Editing symlinked files

Because the files in `~` are symlinks into this repo, **editing through the
symlink edits the repo file directly** — they are the same file on disk. So you
can edit in either place and it just works:

```bash
nvim ~/.zshrc                  # edits ~/.dotfiles/.zshrc via the symlink
nvim ~/.dotfiles/.zshrc        # edits the same file directly
```

Either way, `cd ~/.dotfiles && git diff` shows the change, ready to commit. You
do **not** need to re-run stow after editing an already-stowed file.

> ⚠️ Some apps rewrite their config file in place (replacing the symlink with a
> regular file), which silently breaks the link to the repo. If `git status`
> stops showing your edits, check with `ls -l <file>` — if it's no longer a
> symlink, copy it back into the repo and re-stow.

## When to run stow

Run `stow .` from the repo root only when the set of symlinks needs to change —
not for ordinary edits. Specifically:

- **Fresh machine / first setup** — to create all the symlinks (see Quick Start).
- **After adding a new config file or directory** to the repo, so a symlink for
  it gets created. Use `stow --restow .` (or `stow -R .`) to refresh links and
  prune stale ones.
- **To remove symlinks**, run `stow -D .` (delete) for the whole repo.

Day-to-day edits to files that are already stowed need no stow command — the
symlink already points at the repo.
