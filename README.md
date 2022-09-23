# AbstractlyZach's Dotfiles

I use [rcm](https://github.com/thoughtbot/rcm) to manage my personal dotfiles.

This is the repo I use to set up my personal dotfiles on personal computers. If you're looking for
the system I use to merge both my personal and work dotfiles, you can find it here:
[update this link after I move the dotfile manager to public repo]()

## Required Dependencies
```
rcm
```

## Downloading

```
$ git clone https://github.com/abstractlyZach/dotfiles.git
```

## Using rcm

These commands will allow you to use [rcm](https://github.com/thoughtbot/rcm)'s suite of tools to
perform various dotfile management commands. You could also use the commands in the [Makefile](Makefile)
for convenience.

### Dry-run the installation

Make sure to include any `-t <tag-name>` flags that you'd like.

```
$ RCRC=./rcrc lsrc
```

### Do the installation

```
$ RCRC=./rcrc rcup
```
