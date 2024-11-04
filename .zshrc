export CDPATH=.:~:~/repos

export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
export PNPM_HOME="/Users/ericbloch/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ericbloch/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ericbloch/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ericbloch/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ericbloch/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Moved to .zshenv
#source $(brew --prefix nvm)/nvm.sh
#export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk && export PATH=$PATH:$ANDROID_HOME/emulator && export PATH=$PATH:$ANDROID_HOME/platform-tools && export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin


alias rb 'npx react-native run-ios --mode Release --device "Eric Bloch’s iPhone"'

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws


export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


export TRAINER_INSTANCE_ID=i-0f925a58665cbb71f 
alias start-trainer="aws ec2 start-instances --instance-ids ${TRAINER_INSTANCE_ID}"
ssh-trainer() {
    ssh -i ~/keys/ml-host-key.pem -l ubuntu $(aws ec2 describe-instances --instance-ids $TRAINER_INSTANCE_ID  --query "Reservations[0].Instances[0].PublicDnsName" --output text)
}

