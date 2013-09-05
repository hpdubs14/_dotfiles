alias ll="ls -al"

alias subl="'/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'"

#rm alias to confirm deletes
if [ -n "$PS1" ] ; then
  rm () 
  { 
      ls -FCsd "$@"
      echo 'remove[ny]? ' | tr -d '\012' ; read
      if [ "_$REPLY" = "_y" ]; then
          /bin/rm -rf "$@"
      else
          echo '(cancelled)'
      fi
  }
fi

source ~/.bashrc

export PATH="/usr/local/bin:$PATH:/usr/local/sbin"

export PATH="$HOME/bin:/usr/local/mysql/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# for GraphViz
export PATH=/usr/local/graphviz/bin:$PATH
export EDITOR= 'subl -w'