# `gitcd` - clone direcory and cd into it

## Installation and usage

This lines go to your `~/.zshrc`:
```sh
# Load this plugin with your favorite plugin manager like this
zplugin load lainiwa/gitcd
# Set GITCD_HOME. The default value is "${HOME}/Code"
export GITCD_HOME=${HOME}/tmp
# Set GITCD_TRIM to any non-empty value if you want a flat direcory structure
# instead of nested (nested is default)
export GITCD_TRIM=1
```

Then `gitcd <repo-url>` to clone repo and `cd` into it.

## Thanks
This is a fork of [viko16/gitcd.plugin.zsh](https://github.com/viko16/gitcd.plugin.zsh) modified according to my taste.
