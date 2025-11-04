# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
#export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
# zstyle ':omz:update' mode auto      # update automatically without asking
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
plugins=(git zsh-history-substring-search zsh-vi-mode)

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias loadenv='set -o allexport; source ${HOME}/repos/2494shr/.env ; set +o allexport'
alias empty='git commit --allow-empty -m "run:batch-test"'
alias vz='vim ~/.zshrc'

export CDPATH=.:~:~/repos:~/repos/2494shr

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ericbloch/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ericbloch/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ericbloch/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ericbloch/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export ANDROID_HOME=$HOME/Library/Android/sdk && export PATH=$PATH:$ANDROID_HOME/emulator && export PATH=$PATH:$ANDROID_HOME/platform-tools && export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

. "$HOME/.local/bin/env"

#source /opt/homebrew/opt/autoenv/activate.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#pyenv activate my-env-3.12

# Auto-activate virtual environment when entering the project directory
auto_activate_venv() {
  if [ -f .python-version ]; then
    pyenv local "$(cat .python-version)"  # Ensure correct Python version
  fi

  if [ -d .venv ]; then
    source .venv/bin/activate
    echo "Activated virtual environment: $(pwd)/.venv"
  fi
}

# Trigger auto-activation when changing directories
if [[ -t 1 ]]; then
    cd() {
      builtin cd "$@" || return
      # auto_activate_venv
    }
fi


export SRC_ENDPOINT=https://sourcegraph.com
export SRC_ACCESS_TOKEN=sgp_fd1b4edb60bf82b8_5cbf77b776ec4e963b51be39bec1e3b966427b89
export PAGER=less

ulimit -n 64000

bindkey '\eP' history-substring-search-up
bindkey '\eN' history-substring-search-down

bindkey -M vicmd '\eP' history-substring-search-up
bindkey -M vicmd '\eN' history-substring-search-down
bindkey -M viins '\eP' history-substring-search-up
bindkey -M viins '\eN' history-substring-search-down

##################

# Stuff from older .zshrc



# Moved to .zshenv
#source $(brew --prefix nvm)/nvm.sh
#export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Added by Amplify CLI binary installer
# export PATH="$HOME/.amplify/bin:$PATH"

#export ANDROID_HOME=$HOME/Library/Android/sdk && export PATH=$PATH:$ANDROID_HOME/emulator && export PATH=$PATH:$ANDROID_HOME/platform-tools && export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin


# alias rb 'npx react-native run-ios --mode Release --device "Eric Bloch’s iPhone"'

# autoload bashcompinit && bashcompinit
# autoload -Uz compinit && compinit
# complete -C '/usr/local/bin/aws_completer' aws


# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"


# export TRAINER_INSTANCE_ID=i-0f925a58665cbb71f 
# alias start-trainer="aws ec2 start-instances --instance-ids ${TRAINER_INSTANCE_ID}"
# ssh-trainer() {
#     ssh -i ~/keys/ml-host-key.pem -l ubuntu $(aws ec2 describe-instances --instance-ids $TRAINER_INSTANCE_ID  --query "Reservations[0].Instances[0].PublicDnsName" --output text)
# }

