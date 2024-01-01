set -o vi
export HOMEBREW_NO_AUTO_UPDATE=1

# ~/.zshrc
eval "$(starship init zsh)"

export TERM="xterm-256color"

# Sort by modification time
alias left='ls -t -1'

# Count files
alias count='find . -type f | wc -l'

# Create a Python virtual environment
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

# Add a copy progress bar
alias cpv='rsync -ah --info=progress2'

# Simplify your Git workflow
alias startgit='cd `git rev-parse --show-toplevel` && git checkout master && git pull'
alias cg='cd `git rev-parse --show-toplevel`'

# Change directories and view the contents at the same time
function cl() {
    DIR="$*";
	# if no DIR given, go home
	if [ $# -lt 1 ]; then 
		DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
	ls -F --color=auto
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
