# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without askingG
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
  zsh-autosuggestions
	zsh-syntax-highlighting
	asdf
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# asdf config
. $HOME/.asdf/asdf.sh

# atuin config
eval "$(atuin init zsh)"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# replace ls for exa
alias ls=exa -G -x -F --icons -S  --git --color=always
# replace cat for bat
alias cat=bat

export EDITOR='nvim'

alias ipy='ipython'

# load file .zsh_env_vars if it exists to set environment
[ -f ~/.zsh_env_vars ] &&  source ~/.zsh_env_vars || true

# load file .zsh_evite if it exists to set environment
[ -f ~/.zsh_evite ] &&  source ~/.zsh_evite || true

# enable docker in wsl
if grep -q "microsoft" /proc/version > /dev/null 2>&1; then
    if service docker status 2>&1 | grep -q "is not running"; then
        wsl.exe --distribution "${WSL_DISTRO_NAME}" --user root \
            --exec /usr/sbin/service docker start > /dev/null 2>&1
    fi
fi

# enable docker in macos
if ! docker info >/dev/null 2>&1; then
    echo "⛴️ Initializing Docker..."
    open --background -a Docker
fi

# bun stuff
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/home/doggao/.bun/_bun" ] && source "/home/doggao/.bun/_bun"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

## fzf stuff
#
# git checkout
alias gc='git branch --format="%(refname:short)" | fzf | xargs git checkout'
# one-liner alias  (mind the nested quotes)
cgw () {
  local dir
  dir=$(
    git worktree list \
    | fzf --ansi \
          --preview 'bash -c "git -C $(echo {} | awk '\''{print $1}'\'') log --graph --decorate --oneline -n 20"' \
    | awk '{print $1}'
  ) || return
  cd "$dir"
}
# docker logs
alias dl="docker ps --format '{{.Names}}' | fzf --preview='docker logs {1} | tail -n 30' | awk '{print \$1}' | xargs docker logs -f"
# docker attach
alias da='docker attach "$(docker ps | fzf --preview="docker logs {1}" | awk '\''{print $1}'\'')"'
alias dx='docker exec -it "$(docker ps | fzf --preview="docker logs {1}"| awk '\''{print $1}'\'')" bash'
alias dr='docker restart "$(docker ps | fzf --preview="docker logs {1}"| awk '\''{print $1}'\'')"| ECHO "Restarting container..."'
alias dx='docker exec -it "$(docker ps | fzf --preview="docker logs {1}"| awk '\''{print $1}'\'')" bash'

alias terminou="echo 'Terminou' | terminal-notifier -sound default"

# ai
export AIDER_EDITOR=nvim

# only for mac
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Requirements
  # cargo install timer-cli
  # brew install terminal-notifier

  function notify_timer() {
    local duration="$1"
    local message="$2"

    if [[ -z "$duration" || -z "$message" ]]; then
      echo "Usage: notify_timer <00:00> <message>"
      return 1
    fi

    timer "$duration" && echo "$message" | terminal-notifier -sound default
  }
fi

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export NDK_HOME="/opt/homebrew/share/android-ndk"
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools\latest\bin

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"
# pnpm
export PNPM_HOME="/Users/doggao/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/doggao/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/doggao/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/doggao/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/doggao/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
