# Put these lines in your ~/.bashrc file to get Git tab completion and a nice # prompt. You will have to move the git-completion.bash file (which comes
# with the Git source code) to the proper location. See the OS X/Linux
# installation screencast for details.

# Git tab completion
#source ~/.git-completion.sh

# if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
#
#   # First try to load from a user install
#   source "$HOME/.rvm/scripts/rvm"
#
# elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
#
#   # Then try to load from a root install
#   source "/usr/local/rvm/scripts/rvm"
#
# else
#
#   printf "ERROR: An RVM installation was not found.\n"
#
# fi

# Show branch in status line
PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#Add psql path for Postgres
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

[[ -s "/home/user/.rvm/scripts/rvm" ]] && source "/home/user/.rvm/scripts/rvm" # This loads RVM into a shell session.

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