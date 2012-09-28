# For interactive shells, set the prompt to show the host name and event number.

setenv SVN_EDITOR /usr/bin/vim
setenv SHORT_HOST ${HOST:s/.markmail.int//}
setenv SHORT_HOST ${SHORT_HOST:s/.local//}
setenv SHORT_HOST ${SHORT_HOST:s/.marklogic.com//}

if ( (! $?ENVONLY) && $?prompt ) then
        set white = 37
        set black = 30
        set red = 31
        set green = 32
        set blue = 34
        set magenta = 35

        set ext = $HOST:s/.markmail.int//:e
        set ext = $HOST:s/.markmail.int//:e
        switch ($ext) 
            case 'hosted':
            case 'hn':
                set col = $red
                breaksw;
            case 'a':
            case 'public':
                set col = $red
                breaksw;
            case 'b':
                set col = $magenta
                breaksw;
            default:
            case 'dev':
                set col = $black
        endsw
        

        if ( -o /bin/su ) then
                if ($shell == /bin/csh) then
                    set prompt="(${HOST}) ==# "
                else
                    set prompt = "%{\033[0;1;${col}m%}(%B${SHORT_HOST}) ==#%{\033[0;1;${black}m%}%b "
                endif
        else
                if ($shell == /bin/csh) then
                    set prompt="(${HOST}) ==> "
                else
                    set prompt = "%{\033[0;1;${col}m%}(%B${SHORT_HOST}) ==>%{\033[0;1;${black}m%}%b "
                endif
        endif 
endif

if ($shell == /bin/tcsh) then
    bindkey ^W backward-delete-word
endif

set history = 1000
set savehist = 1000
set savedirs 
set histfile = ~/.history-${SHORT_HOST}
set dirfile = ~/.dirs-${SHORT_HOST}

alias add2path  'set d_ = \!:1 \
    foreach i ($path) \
        if ("$i" == "$d_") then  \
             set d_ = ""; break;  \
        endif \
    end \
    set path = ("$d_" $path) \
    unset d \
    '

alias cwdcmd 'echo -n "]2;${HOST:s/.markmail.int//}:${cwd}"'

#alias ssh ssh -L6000:localhost:6000
alias vc '/usr/bin/vim ~/.cshrc'
alias va '/usr/bin/vim ~/.cshrc'
alias sc 'source ~/.cshrc'
alias pu pushd
alias po popd
alias c clear
alias j jobs
alias h history
alias more 'less -X -L'
alias less 'less -X -L'
alias p4 'p4 -d `cygpath -wa .`'
alias ant 'ant -emacs'
alias su 'sudo -u root /bin/tcsh'
alias white 'set prompt = "%{\033[0;1;37m%}(%B${SHORT_HOST}) ==>%{\033[0;1;30m%}%b "'

set autologout=0

#cd .
#cwdcmd

alias cdm 'cd /usr/local/markmail'
alias cdx 'cd /usr/local/markmail/xquery'
alias cda 'cd /usr/local/markmail/xquery/admin'
alias cdu 'cd /usr/local/markmail/xquery/userui'
alias cdr 'cd ~/rundmc'
alias cdra 'cd ~/rundmc-apidoc'
alias cdc 'cd ~/comoms'

if (-e ~/.marklogic.cshrc) source ~/.marklogic.cshrc

if ("$OSTYPE" == "darwin") then
    alias ls 'ls -sFG'
else
    alias ls 'ls -sF --color'
endif

setenv PAGER 'less -X'

setenv CQSH_HOME /Users/ebloch/cqsh

alias mmload 'nohup python /usr/local/markmail/bin/load.py \!* >>& mmload.out &'

add2path /opt/CollabNet_Subversion/bin/
add2path /sbin
add2path /usr/sbin
add2path /usr/local/markmail/bin
add2path /opt/local/bin
add2path /opt/local/sbin

alias svd 'svn diff --diff-cmd ~/bin/vd'

alias 'bgit' '/usr/bin/sudo -u git -H tcsh'

alias 'ml' 'ssh ebloch@ssh.marklogic.com'

add2path /Users/ebloch/cqsh
add2path /usr/local/mysql/bin
add2path /usr/local/apache-maven-3.0.4/bin
add2path /usr/local/git/bin
add2path /Applications/depx-0.1

alias svd 'svn diff --diff-cmd ~/bin/vd'

alias gs 'git status'


alias 's2xec2' 'ssh root@ec2-184-73-4-47.compute-1.amazonaws.com'

##
# Your previous /Users/ebloch/.cshrc file was backed up as /Users/ebloch/.cshrc.macports-saved_2010-03-05_at_22:32:39
##

# MacPorts Installer addition on 2010-03-05_at_22:32:39: adding an appropriate PATH variable for use with MacPorts.
# Finished adapting your PATH environment variable for use with MacPorts.

if (-e ~/dotfiles/.cshrc."$SHORT_HOST") source ~/dotfiles/.cshrc."$SHORT_HOST"

##
# Your previous /Users/ebloch/.cshrc file was backed up as /Users/ebloch/.cshrc.macports-saved_2012-09-28_at_10:27:08
##

# MacPorts Installer addition on 2012-09-28_at_10:27:08: adding an appropriate PATH variable for use with MacPorts.
#setenv PATH /opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

