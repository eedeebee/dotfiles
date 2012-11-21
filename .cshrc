# For interactive shells, set the prompt to show the host name and event number.

setenv SVN_EDITOR /usr/bin/vim
setenv SHORT_HOST ${HOST:s/.markmail.int//}
setenv SHORT_HOST ${SHORT_HOST:s/.local//}
setenv SHORT_HOST ${SHORT_HOST:s/.marklogic.com//}

if ( (! $?ENVONLY) && $?prompt ) then
        set black = 30
        set red = 31
        set green = 32
        set blue = 34
        set magenta = 35

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

set autologout=0

#cd .
#cwdcmd

#source ~/.jh-tcshrc

alias cdx 'cd /usr/local/markmail/xquery'
alias cda 'cd /usr/local/markmail/xquery/admin'
alias cdu 'cd /usr/local/markmail/xquery/userui'

if (-e ~/.marklogic.cshrc) source ~/.marklogic.cshrc

if ("$OSTYPE" == "darwin") then
    alias ls 'ls -sFG'
else
    alias ls 'ls -sF --color'
endif

setenv PAGER 'less -X'

alias mmload 'nohup python /usr/local/markmail/bin/load.py \!* >>& mmload.out &'

add2path /opt/CollabNet_Subversion/bin/
add2path /sbin
add2path /usr/sbin
add2path /usr/local/markmail/bin

alias svd 'svn diff --diff-cmd ~/bin/vd'


##
# Your previous /Users/ebloch/.cshrc file was backed up as /Users/ebloch/.cshrc.macports-saved_2010-03-05_at_22:32:39
##

# MacPorts Installer addition on 2010-03-05_at_22:32:39: adding an appropriate PATH variable for use with MacPorts.
setenv PATH /opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

