# aliases
alias la="ls -la"
alias vim="nvim ."
alias cfg="nvim ~/.config/nvim"
alias shcfg="nvim ~/.zshrc"
alias tmuxcfg="nvim ~/.tmux.conf"
alias t="tree -ph"
alias dcmp="docker-compose"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias src="source ~/.zshrc"
alias note="~/dev/scripts/note.sh"

# PATH
export PATH=$PATH:/Users/akalpaki/.volta/bin

#starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# fzf
source <(fzf --zsh)
# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'
# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS='--walker file,dir,follow,hidden'
# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow'
# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}
