# My configuration files

Here are my dotfiles.

## Installation

Go to the home directory.

```
cd ~
```

Create the preferred location (in my case `~/.dotfiles`).

```
mkdir -p ~/.dotfiles
```

Clone the repo to the preferred location.

```
git clone https://github.com/GandertM/dotfiles.git ~/.dotfiles
```

## Usage

For maintenance of my dotfiles I use `stow`.

Go to the `~/.dotfiles`.

```
cd ~/.dotfiles
```

Run `stow` for any of the programs specific (example for bash).

```
stow bash
```





