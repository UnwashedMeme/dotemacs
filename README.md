# Shared emacs config

## Installation

* clone this repo
* `git submodule update --init`
* make `~/.emacs.d` a link to this directory
* open emacs
* run `M-x package-list-packages` to fetch gnu/marmalade/melpa packages
* close emacs
* open emacs to auto-install many gnu/marmalade/melpa packages

### for lisp dev

* ensure `~/projects/lisp` points to your lisp code directory

Most of the functionality in our shared-slime-init.el is replaced in
smart-parens, there are different keybindings that need some more
help.

### for js dev

* `sudo aptititde install npm`
* `npm install jshint -g
`
Now you get syntax hightlighting and warnings from [jshint][] when
editing javascript files.

Some refactoring helpers (like "rename variable") are available via
the [js2-refactor][] library.

[jshint]: http://www.jshint.com/
[js2-refactor]: https://github.com/magnars/js2-refactor.el

### for python dev

* `sudo pip install -U elpy`

## Notable libraries

* [Projectile][] - deal with "projects", search within, jump between,
  etc. `C-c p`
* [yasnippet][] - lightweight templates
* [magit][] - git client, `M-x magit-status`
* [smartparens][] - paren matching and sexp manipulation

[Projectile]: https://github.com/bbatsov/projectile
[yasnippet]: https://github.com/capitaomorte/yasnippet
[magit]: https://github.com/magit/magit
[smartparens]: https://github.com/Fuco1/smartparens

## Guidelines

* files in the `settings` folder get loaded automatically, so add a
  new file to configure a new package
* use the `ensure-packages-installed` helper to get libraries
* use `customize` for machine-specific settings, keep global settings
  in the `settings` files
