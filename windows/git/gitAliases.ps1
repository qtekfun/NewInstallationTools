git config --global core.editor "vim"
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.backup '!f() { git branch $(date "+backup/%Y/%m/%d/%H%M%S") "$@"; }; f'
git config --global alias.alias 'git config --get-regexp alias'
git config --global alias.lg "log --graph --branches=local/ HEAD main --oneline"
git config --global alias.lg1 "log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white black)%s%C(reset) %C(bold cyan)-- %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative --branches=local/"
git config --global alias.lg2 "log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white black)%s%C(reset) %C(bold cyan)-- %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative --branches=local/ HEAD main"
git config --global alias.lg3 "log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white black)%s%C(reset) %C(bold cyan)-- %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative --all'"