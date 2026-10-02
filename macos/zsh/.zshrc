# ---------------------------------------------------------------------------
# Powerlevel10k instant prompt. Keep at the very top of ~/.zshrc.
# ---------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------------------------------------------------------------------------
# PATH / environment
# ---------------------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="vim"
export VISUAL="$EDITOR"
export LANG="en_US.UTF-8"

# ---------------------------------------------------------------------------
# Oh My Zsh
# ---------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto        # auto-update OMZ without prompting
zstyle ':omz:update' frequency 14

plugins=(
  git                       # 100+ git aliases (gst, gco, gcm, glog, ...)
  fzf                       # ctrl-r / ctrl-t / alt-c fuzzy widgets
  direnv                    # auto-load .envrc per directory
  extract                   # `x file.tar.gz` unpacks anything
  colored-man-pages
  command-not-found         # suggests the brew formula for missing commands
  sudo                      # tap ESC twice to prepend sudo
  macos                     # ofd, cdf, quick-look, ...
  history-substring-search  # type a prefix, then Up arrow
  zsh-completions
  zsh-autosuggestions       # ghost-text suggestion from history
  zsh-syntax-highlighting   # MUST be last
)

source "$ZSH/oh-my-zsh.sh"

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS   # drop older duplicate entries
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY            # expand !! before running it
setopt SHARE_HISTORY          # sync history across open shells
setopt EXTENDED_GLOB
setopt AUTO_CD                # `foo/` instead of `cd foo/`

# ---------------------------------------------------------------------------
# Tools
# ---------------------------------------------------------------------------
eval "$(zoxide init zsh)"     # `z tinygrad` jumps to frecent dirs

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --info=inline'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :200 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always {}'"

export BAT_THEME="ansi"

# threadr: find, resume and fork agent sessions (github.com/shariqnaiyer/threadr)
# >>> threadr >>>
[[ -f ~/Documents/dev/threadr/src/threadr/threadr.sh ]] && source ~/Documents/dev/threadr/src/threadr/threadr.sh
# <<< threadr <<<
# herdr panes resume and fork agents with permission prompts skipped.
[[ -n $HERDR_ENV ]] && export THREADR_YOLO=1

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
alias ls='eza --group-directories-first'
alias ll='eza -lah --group-directories-first --git'
alias lt='eza --tree --level=2 --group-directories-first'
alias cat='bat --paging=never'
alias grep='rg'

alias gs='git status -sb'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate -20'

alias c='claude --dangerously-skip-permissions'
alias py='python3'
alias venv='uv venv && source .venv/bin/activate'
alias act='source .venv/bin/activate'

alias zshrc='$EDITOR ~/.zshrc'
alias reload='exec zsh'
alias path='echo $PATH | tr ":" "\n"'

# ---------------------------------------------------------------------------
# Keybindings
# ---------------------------------------------------------------------------
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[1;3D' backward-word     # alt-left
bindkey '^[[1;3C' forward-word      # alt-right

# ---------------------------------------------------------------------------
# Local, machine-specific overrides (not tracked)
# ---------------------------------------------------------------------------
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ---------------------------------------------------------------------------
# Powerlevel10k config. Run `p10k configure` to regenerate.
# ---------------------------------------------------------------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
