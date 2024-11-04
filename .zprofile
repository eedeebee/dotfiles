if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
    eval "$(ssh-agent -s)"
fi

# Setting PATH for Python 2.7
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home/
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home/
PATH="${JAVA_HOME}bin:${PATH}"
export PATH


# Added by me
export PATH="$(brew --prefix rbenv)/bin:$PATH"
# Added by `rbenv init` on Mon Jul 15 19:52:33 PDT 2024
eval "$(rbenv init - --no-rehash zsh)"
