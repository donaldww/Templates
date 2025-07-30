# === Editor configs ===
alias e='zed'
alias ez='e ~/.zprofile'
alias ep='e ~/.zshrc'
alias ea='e ~/.aliases.zsh'
alias ef='e ~/.functions.zsh'
alias es='e ~/.secrets.zsh'

# === Sourcing ===
alias xp='source ~/.zshrc'

# === List commands ===
alias ls='lsd'
alias la='ls -a'
alias ll='ls -la'
alias lb='ls ~/.local/bin'

# === Safety & system ===
alias rd='yes | rm -rf'
alias rmf='rm -i -rf'
alias h='history -500'

# === Rust ===
alias cr='cargo run'
alias crr='cargo run --release'
alias ct='cargo test -- --include-ignored'
alias cb='cargo build'
alias cbr='cargo build --release'

# === Other languages ===
alias mt='mix test --include pending'
alias bt='BATS_RUN_SKIPPED=false bats'
alias pt='pytest'
alias st='RUNALL=true swift test'
alias gt='go test'
alias zt='zig test'
alias sf='swift-format -i Sources/*/* Tests/*/*'

# === Containers ===
alias trivy-colima='DOCKER_HOST=unix://$HOME/.colima/default/docker.sock trivy'

# === Kubernetes ===
alias k='kubectl'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias kcc='kubectl config current-context'
alias kctx='kubectl config use-context'
alias kns='kubectl config set-context --current --namespace'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods -A'
alias kgs='kubectl get svc'
alias kgn='kubectl get nodes'
alias kng='kubectl create deployment nginx --image=nginx && kubectl expose deployment nginx --port=80 --type=NodePort'e

# === Git Aliases ===
# Basic Git commands
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gst='git status'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gd='git diff'
alias gds='git diff --staged'

# Push and pull
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gl='git pull'
alias gpr='git pull --rebase'

# Fetch and merge
alias gf='git fetch'
alias gfo='git fetch origin'
alias gm='git merge'
alias gma='git merge --abort'

# Stash
alias gss='git stash'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gstc='git stash clear'
alias gstl='git stash list'

# Log
alias glg='git log --graph --oneline --decorate'
alias glga='git log --graph --oneline --decorate --all'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'

# Reset
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

# Clean
alias gclean='git clean -fd'

# Remote
alias gr='git remote'
alias grv='git remote -v'

# Rebase
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
alias grbi='git rebase -i'

# Difftool and Mergetool
alias gdt='git difftool'
alias gmt='git mergetool'
