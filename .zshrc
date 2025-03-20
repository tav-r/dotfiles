# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
# End of lines configured by zsh-newuser-install

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

# alias:target:condition
ALIASES=(
    'ls:exa -l --sort=time:exa'
    'cat:bat:bat'
    'docker:podman:podman'
    'docker-compose:podman-compose:podman-compose'
    'diff:diff --color=auto:diff'
    'mip:dig @ns1-1.akamaitech.net ANY whoami.akamai.net +short:dig'
    'config:/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME:git'
)

for al in ${ALIASES[*]}; do
    name=$(echo $al | cut -d':' -f1)
    target=$(echo $al | cut -d':' -f2)
    condition=$(echo $al | cut -d':' -f3)

    if which $condition > /dev/null; then
        alias "$name"="$target"
    fi
done

if alias config | grep -E "^config='/usr/bin/git " > /dev/null; then
    source /usr/share/git/completion/git-completion.zsh &>/dev/null
    __git_complete config __git_main
fi

fzf-history() {
    BUFFER=$(history -n 0 | fzf --reverse )
    CURSOR=$#BUFFER
}

zle -N fzf-history
if which fzf > /dev/null; then
    bindkey "^R" fzf-history
fi

# enable plugins (if they are instaled)
if [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -e /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# start ssh agent if not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

if which starship > /dev/null; then
    eval "$(starship init zsh)"
fi

if which zoxide > /dev/null; then
    eval "$(zoxide init zsh)"
fi

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH:$HOME/.local/bin
export XDG_DATA_DIRS=~/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export _JAVA_AWT_WM_NONREPARENTING="1"

[ -f "/home/tav/.ghcup/env" ] && source "/home/tav/.ghcup/env" # ghcup-env
