# Author: karateSwag
# Repo: https://github.com/karateswag/dotfiles

# Path to oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

# Bootstraping oh-my-zsh install
if [[ ! -d $ZSH ]]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH
fi

# Bootstraping p10k-zsh install
if [[ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

### P10K ZSH ###################################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Export $PATH.
export PATH=$HOME/.local/bin:$PATH

# Themes:
ZSH_THEME="powerlevel10k/powerlevel10k"

# Bootstraping custom plugins:
# zsh-autosuggestions
if [[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions  ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
# zsh-syntax-highlighting
if [[ ! -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

# Plugins:
plugins=(
  git
  kubectl
  ansible
  helm
  zsh-autosuggestions # git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  zsh-syntax-highlighting # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Aliases: 

# archives extractor 
extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# root privileges
alias doas="doas --"
alias sudo='sudo '

# navigation
alias ..='cd ..' 
alias ...='cd ../..'

# vim
alias vim=nvim

# Changing "ls" to "exa"
alias ll='exa -l --color=always --group-directories-first' # my preferred listing
alias la='exa -la --color=always --group-directories-first'  # all files and dirs
alias ls='exa --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# adding flags
alias cp="cp -i"                          # confirm before overwriting something
alias mv="mv -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -h'                      # show human-readable

# Power Management
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias hibernate="systemctl hibernate"
alias suspend="systemctl suspend"

### P10K ZSH ###################################################################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
