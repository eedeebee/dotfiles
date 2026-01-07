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
alias sz='source ~/.zshrc'

# Dynamic CDPATH that adjusts based on git worktree
update_cdpath() {
  # Only bother checking git status if we're in a likely location
  if [[ "$PWD" == "$HOME/repos"* ]]; then
    local git_root=""
    
    if git rev-parse --show-toplevel > /dev/null 2>&1; then
      git_root=$(git rev-parse --show-toplevel 2>/dev/null)
      local git_dir=$(git rev-parse --git-dir 2>/dev/null)
      
      if [[ "$git_dir" == *".git/worktrees"* ]]; then
        export CDPATH=.:~:~/repos:$git_root
        return
      fi
    fi
  fi
  
  # Default for everywhere else
  export CDPATH=.:~:~/repos:~/repos/2494shr
}

# Initialize CDPATH on shell startup
update_cdpath

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ericbloch/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ericbloch/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ericbloch/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ericbloch/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# export ANDROID_HOME=$HOME/Library/Android/sdk && export PATH=$PATH:$ANDROID_HOME/emulator && export PATH=$PATH:$ANDROID_HOME/platform-tools && export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

. "$HOME/.local/bin/env"

#source /opt/homebrew/opt/autoenv/activate.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
# Disable pyenv-virtualenv's automatic prompt modification since we'll create our own
export VIRTUAL_ENV_DISABLE_PROMPT=1
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
      update_cdpath
      # auto_activate_venv
    }
fi

# Custom prompt with pyenv and git info (including worktrees)
setopt PROMPT_SUBST

# Function to get pyenv version/virtualenv
pyenv_prompt_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "($(basename $VIRTUAL_ENV))"
    elif [[ -n "$PYENV_VERSION" ]]; then
        echo "($PYENV_VERSION)"
    fi
}

# Function to get git branch and worktree info
git_prompt_info() {
    # Check if we're in a git repository
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || echo "detached")
        local worktree_info=""
        
        # Check if we're in a worktree (not the main working tree)
        local git_dir=$(git rev-parse --git-dir 2>/dev/null)
        if [[ "$git_dir" == *".git/worktrees"* ]]; then
            # Get the worktree path (relative to home or absolute)
            local worktree_path=$(git rev-parse --show-toplevel 2>/dev/null)
            if [[ -n "$worktree_path" ]]; then
                # Show relative to home if possible, otherwise show basename
                if [[ "$worktree_path" == "$HOME"/* ]]; then
                    worktree_info=" [~${worktree_path#$HOME}]"
                else
                    worktree_info=" [$(basename "$worktree_path")]"
                fi
            fi
        fi
        
        # Get status indicators
        local git_status=""
        if ! git diff --quiet 2>/dev/null; then
            git_status="${git_status} *"
        fi
        if ! git diff --cached --quiet 2>/dev/null; then
            git_status="${git_status} +"
        fi
        
        echo " ($branch$worktree_info$git_status)"
    fi
}

git_main_to_cbc() {
    git fetch origin &&
    git checkout eedeebee/cloud-batch-cli &&
    git reset --hard origin/main &&
    git push --force-with-lease origin eedeebee/cloud-batch-cli
}


# Custom prompt: pyenv + git + directory + prompt
PROMPT='$(pyenv_prompt_info)$(git_prompt_info) %~ $ '

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

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# export JAVA_HOME=$(/usr/libexec/java_home -v 17)
# export PATH="$JAVA_HOME/bin:$PATH"

use_expo() {
    # Convert PATH to array and filter out Java-related paths
    local new_path=()
    for dir in ${(s/:/)PATH}; do
        # Skip Java-related directories but keep system paths
        if [[ "$dir" != *"openjdk"* && "$dir" != *"/jdk"* && "$dir" != "/opt/homebrew/opt/openjdk"* ]]; then
            # Also remove any existing JAVA_HOME/bin
            if [ -n "$JAVA_HOME" ] && [[ "$dir" != "$JAVA_HOME/bin" ]]; then
                new_path+=("$dir")
            elif [ -z "$JAVA_HOME" ]; then
                new_path+=("$dir")
            fi
        fi
    done
    export PATH=${(j/:/)new_path}
    
    export JAVA_HOME=$(/usr/libexec/java_home -v 17)
    export PATH="$JAVA_HOME/bin:$PATH"
    export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
    export PATH="$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$PATH"
    nvm use 22
}

use_rn72() {
    # Save old JAVA_HOME before unsetting
    local old_java_home="$JAVA_HOME"
    unset JAVA_HOME
    
    # Explicitly remove ALL Java paths from PATH using a more robust method
    # Split PATH, filter out Java paths, rejoin
    local -a path_array
    path_array=(${(s/:/)PATH})
    local -a clean_path
    clean_path=()
    
    for dir in "${path_array[@]}"; do
        # Skip if it contains Homebrew Java paths (openjdk, but keep system /Library/Java paths)
        if [[ "$dir" == *"openjdk"* ]] || \
           [[ "$dir" == "/opt/homebrew/opt/openjdk"* ]] || \
           [[ "$dir" == *"/opt/homebrew/Cellar"*"openjdk"* ]] || \
           [[ "$dir" == *"/Cellar"*"openjdk"* ]] || \
           [[ "$dir" == *"/opt/homebrew"*"java"* ]] || \
           [[ "$dir" == *"/opt/homebrew"*"jdk"* ]]; then
            continue
        fi
        # Also remove any existing JAVA_HOME/bin if it was set
        if [ -n "$old_java_home" ] && [[ "$dir" == "$old_java_home/bin" ]]; then
            continue
        fi
        clean_path+=("$dir")
    done
    
    export PATH=${(j/:/)clean_path}
    
    # Find system Java - prioritize /Library/Java/JavaVirtualMachines (system Java)
    # Explicitly use Zulu 11 or first non-Homebrew Java found
    local system_java_home=""
    if [ -d "/Library/Java/JavaVirtualMachines" ]; then
        # Find system Java installations, prefer Zulu 11, then any other system Java
        local zulu11_path="/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"
        if [ -d "$zulu11_path" ]; then
            system_java_home="$zulu11_path"
        else
            # Find the first system Java installation (exclude Homebrew)
            local jvm_dir=$(ls -d /Library/Java/JavaVirtualMachines/*/Contents/Home 2>/dev/null | grep -v "/opt/homebrew" | head -1)
            if [ -n "$jvm_dir" ] && [ -d "$jvm_dir" ]; then
                system_java_home="$jvm_dir"
            fi
        fi
    fi
    
    # Fallback: use /usr/libexec/java_home but explicitly request Zulu 11
    if [ -z "$system_java_home" ]; then
        system_java_home=$(/usr/libexec/java_home -v 11 2>/dev/null)
        # If that didn't work, try filtering java_home output
        if [ -z "$system_java_home" ] || [[ "$system_java_home" == *"/opt/homebrew"* ]]; then
            local java_home_output=$(/usr/libexec/java_home -V 2>&1 | grep -v "/opt/homebrew" | grep -v "openjdk" | grep -v "Homebrew" | head -1)
            if [ -n "$java_home_output" ]; then
                local java_version=$(echo "$java_home_output" | awk '{print $1}')
                if [ -n "$java_version" ]; then
                    system_java_home=$(/usr/libexec/java_home -v "$java_version" 2>/dev/null)
                fi
            fi
        fi
    fi
    
    # Set JAVA_HOME and add to PATH only if we found a system Java
    if [ -n "$system_java_home" ] && [ -d "$system_java_home/bin" ]; then
        export JAVA_HOME="$system_java_home"
        export PATH="$JAVA_HOME/bin:$PATH"
    fi
    
    export ANDROID_HOME=$HOME/Library/Android/sdk
    export PATH=$PATH:$ANDROID_HOME/emulator
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
    nvm use 18
}

alias kprod='kubectl --context=gke_prototype2-413618_us-central1-c_fai-prod'
alias k='kubectl'