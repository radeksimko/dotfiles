# Dotfiles

My Unix dotfiles.

### OS X - Before installation
You need to have installed [XCode](https://developer.apple.com/downloads/index.action?=xcode) or, at the very minimum, the [XCode Command Line Tools](https://developer.apple.com/downloads/index.action?=command%20line%20tools), which are available as a _much smaller_ download thank XCode.

## How to install it?
With Git (**without** superuser privileges):
```sh
git clone git@github.com:radeksimko/dotfiles.git ~/.dotfiles
~/.dotfiles/bin/dotfiles -i 'git@github.com:radeksimko/dotfiles.git'
```

without Git (**with** superuser privileges):
```sh
bash -c "$(curl -fsSL https://raw.github.com/radeksimko/dotfiles/master/bin/dotfiles)"
```

### TL;DR What does the "dotfiles" do?

When [dotfiles](bin/dotfiles) runs, it does a few things:

1. Files in `init` are executed (if `-i` option is provided)
2. Files in `copy` are copied into `~/`
3. Files in `link` are linked into `~/`
4. Files in `source` are _sourced_
5. `conf/first_time_reminder.sh` is executed after first-time installation

#### Notes

* The `backups` folder only gets created when necessary. Any files in `~/` that would have been overwritten by `copy` or `link` get backed up there.
* Files in `source` get sourced whenever a new shell is opened (in alphanumeric order).
* Files in `conf` just sit there. If a config file doesn't _need_ to go in `~/`, put it in there.

### All steps in detail

#### The "init" step
A whole bunch of things will be installed _only_ if `--with-init` option is provided and _only_ if they aren't already installed.

#### The ~/ "copy" step
Any file in the `copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like [.gitconfig](copy/.gitconfig) which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

#### The ~/ "link" step
Any file in the `link` subdirectory gets symbolically linked with `ln -s` into `~/`. Edit these, and you change the file in the repo. Don't link files containing sensitive data, or you might accidentally commit that data!

#### The "source" step
To keep things easy, the `~/.bashrc` and `~/.bash_profile` files are extremely simple, and should never need to be modified. Instead, add your aliases, functions, settings, etc into one of the files in the `source` subdirectory, or add a new file. They're all automatically sourced when a new shell is opened.

## Inspiration
- https://github.com/cowboy/dotfiles (the `dotfiles` + dirs structure/philosophy)

