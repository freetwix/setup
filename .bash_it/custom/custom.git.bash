alias gitk="/usr/bin/wish $(which gitk)"

# Aliases for git (find more git argument aliases in ~/.gitconfig[aliases])
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(yellow)%d%Creset %s %C(yellow)%an %C(cyan)%cr%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"

# Aliases for git flow
alias gff='git flow feature'
alias gfh='git flow hotfix'
alias gfr='git flow release'

alias gst='git status'
alias gss='git status -s'

# git pull all first level git-based directories in parallel (10)
alias gpall='find . -maxdepth 2 -name ".git" -type d | sed "s/\/.git//" | xargs -P10 -I{} git -C {} pull'

# git pull all git-based (sub)directories in parallel (10)
alias gprall='find . -name ".git" -type d | sed "s/\/.git//" | xargs -P10 -I{} git -C {} pull'

# delete all local branches which are merged into the current branch
#   $> git branch
#     another-branch
#     * master           <-- current branch
alias gdel_merged_local_branches='(git branch --merged | grep -v "\*" | xargs -n 1 git branch -d)'

alias last_commit_id='git rev-parse @'
alias last_branches='git reflog | grep " checkout: " | grep -v "to stable"| cut -d" " -f8 | uniq | head -n10'
