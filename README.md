Emacs Prelude
=============

Prelude is an Emacs distribution that aims to enhance the default
Emacs experience.  Prelude alters a lot of the default settings,
bundles a plethora of additional packages and adds its own core
library to the mix. The final product offers an easy to use Emacs
configuration for Emacs newcomers and lots of additional power for
Emacs power users.

Prelude is compatible **ONLY with GNU Emacs 24.x**. In general you're
advised to always run Prelude with the latest Emacs - currently
**24.3**.

## Installation

```bash
curl -L https://github.com/jwintz/prelude/raw/master/personal/utils/prelude-installer.sh | sh
```

## Updating Prelude

### Manual update

The update procedure is fairly straightforward and consists of 3 steps:

#### Update all bundled packages

Just run <kbd>M-x package-list-packages RET U x</kbd>.

#### Update Prelude's code

```bash
cd path/to/prelude/installation
git pull
```

The `path/to/prelude/installation` is usually `~/.emacs.d` (at least
on Unix systems).

#### Restart Prelude

It's generally a good idea to stop Emacs after you do the update. The
next time Prelude starts it will install any new dependencies (if
there are such).

### Automatic update

Simply run <kbd>M-x prelude-update</kbd> from Emacs itself and restart Emacs afterwards.

## Ugly colors in the terminal Emacs version

If your Emacs looks considerably uglier in a terminal (compared to the
GUI version) try adding this to your `.bashrc` or `.zshrc`:

```bash
export TERM=xterm-256color
```

Source the `.bashrc` file and start Emacs again.
