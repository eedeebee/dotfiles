eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by `rbenv init` on Mon Feb 17 22:03:14 PST 2025
eval "$(rbenv init - --no-rehash zsh)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/bin

export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

export MISTRAL_API_KEY=xZbNIyaXGcC63WdD9daeppGIumcsyzEN
