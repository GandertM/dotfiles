### personal aliases file ###

### aliases ###

# shell
alias s="source ~/.bashrc"
alias c="clear"

# tools
alias rm="trash -v"
alias ed="micro"
alias df="df -h -x tmpfs -x squashfs -x devtmpfs -x efivarfs"
alias extip="curl icanhazip.com"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias mem5="ps auxf | sort -nr -k 4 | head -5"
alias cpu5="ps auxf | sort -nr -k 3 | head -5"
alias ipreset="NIC=$(netstat -r | awk '/default/ {print $NF}' | sort -u | grep -v '^w'); sudo dhclient -r -v $NIC && sudo dhclient -v $NIC"

# ls
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias l='ls -CF'

# bat
alias bat='/usr/bin/batcat'

# apt
alias upd="sudo apt update"
alias upg="sudo apt update && sudo apt upgrade"
alias ins='sudo apt install'
alias sea='sudo apt search'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

### functions ###

update() { sudo nala update && sudo nala upgrade && flatpak update && sudo snap refresh }

cheatsh() {
  # Ask cheat.sh website for details about a Linux command.
  curl -m 10 "http://cheat.sh/${1}" 2>/dev/null || printf '%s\n' "[ERROR] Something broke"
}

flocate() {
  # locate file, but exclude snapshots
  if [ -z "$1" ]
  then
    echo "You need to add a search string!"
  else
    locate "$1" | grep -vi .snapshots
  fi
}

# ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# navigation
#up () {
#  local d=""
#  local limit="$1"

  # Default to limit of 1
#  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
#    limit=1
#  fi

#  for ((i=1;i<=limit;i++)); do
#    d="../$d"
#  done

  # perform cd. Show error if cd fails
#  if ! cd "$d"; then
#    echo "Couldn't go up $limit dirs.";
#  fi
}
