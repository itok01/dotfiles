### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zinit-zsh/z-a-rust \
  zinit-zsh/z-a-as-monitor \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


# Fish-like autosuggestions for zsh
zinit light zsh-users/zsh-autosuggestions

# Fish shell like syntax highlighting for Zsh.
zinit light zsh-users/zsh-syntax-highlighting

# Additional completion definitions for Zsh.
zinit light zsh-users/zsh-completions


# The minimal, blazing-fast, and infinitely customizable prompt for any shell!
if [ ! $(command -v starship) ]; then
  curl -fsSL https://starship.rs/install.sh | zsh
fi
eval "$(starship init zsh)"


# Rust
if [ ! $(command -v rustup) ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi


# command-line fuzzy finder
if [ ! $(command -v fzf) ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  $HOME/.fzf/install
fi

# A modern replacement for ‘ls’.
if [ ! $(command -v exa) ]; then
  cargo install exa
fi
alias ls='exa --icons'

# A cat(1) clone with wings.
if [ ! $(command -v bat) ]; then
  cargo install --locked bat
fi
alias cat='bat --paging=never'
alias less='bat'

# ripgrep recursively searches directories for a regex pattern while respecting your gitignore
if [ ! $(command -v rg) ]; then
  cargo install ripgrep
fi

# A simple, fast and user-friendly alternative to 'find'
if [ ! $(command -v fd) ]; then
  cargo install fd-find
fi

# An interactive cheatsheet tool for the command-line and application launchers
if [ ! $(command -v navi) ]; then
  cargo install navi
fi

# A viewer for git and diff output
if [ ! $(command -v delta) ]; then
  cargo install git-delta
  git config --global core.pager 'delta'
  git config --global interactive.diffFilter 'delta --color-only'
  git config --global delta.line-numbers true
  git config --global delta.diff-so-fancy true
  git config --global delta.keep-plus-minus-markers true
fi
alias diff='delta'


# Zsh config
autoload -U compinit
compinit
zstyle ':completion:*' menu select

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history

typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
