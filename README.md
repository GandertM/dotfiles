# My configuration files

Here are my dotfiles.

## Prerequisites

The following packages need to be present:

### for installation
- curl
- git
- wget
- zsh

Run the following:

```
sudo apt install curl git wget zsh
```

### for usage
- doublecmd-qt
- mc
- nala
- stow
- fonts-firacode
- fzf (see https://github.com/junegunn/fzf)
- micro
- net-tools
- starship (see https://starship.rs/)
- trash-cli
- zoxide (see https://github.com/ajeetdsouza/zoxide)

Run the following:

```
sudo apt install doublecmd-qt mc nala stow fonts-firacode micro net-tools trash-cli
```

See referenced URL's for instructions for most current versions of fzf, starship and zoxide.

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





