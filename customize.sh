apt update
apt -y install git zsh curl

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
mkdir ~/.config
tee -a ~/.config/starship.toml << END
[aws]
symbol = "AWS "

[battery]
full_symbol = "􀛨  "
charging_symbol = "􀢋  "
discharging_symbol = "􀛩  Unplugged "
unknown_symbol = "􀛪  Unknown "
empty_symbol = "􀛪  Empty "
[[battery.display]]
# threshold = 100

[character]
success_symbol = "[􀯻](green)"
error_symbol = "[􀯻](red)"

[cmake]
symbol = "AWS "

[cmd_duration]
format = "[􀐱 \$duration](\$style) "

[conda]
symbol = "Conda "

[crystal]
symbol = "Crystal "

[dart]
symbol = "Dart "

[deno]
symbol = "Deno "

[directory]
read_only = " 􀢍 Read Only "

[docker_context]
symbol = "Docker "

[dotnet]
symbol = ".NET "

[elixir]
symbol = "Elixir "

[elm]
symbol = "Elm "

# [env_var]

[erlang]
symbol = "Erlang "

[gcloud]
symbol = "Google Cloud "

[git_branch]
symbol = "Git 􀙠 "

[git_commit]
tag_symbol = " 􀋡 "
# only_detached = false
tag_disabled = false

[git_state]
rebase = "REBASING"
merge = "MERGING"
revert = "REVERTING"
cherry_pick = "CHERRY-PICKING"
bisect = "BISECTING"
am = "AM"
am_or_rebase = "AM/REBASE"

[git_metrics]
# disabled = false
format = "[􀋸 \$added](\$added_style) [􀋹 \$deleted](\$deleted_style) "

[git_status]
format = "([\$all_status\$ahead_behind](\$style))"
conflicted = "􀇾 Conflicted "
ahead = "􀰫 \${count} Ahead "
behind = "􀰪 \${count} Behind "
diverged = "􀙠 \${ahead_count} Ahead \${behind_count} Behind "
untracked = "􀃬 Untracked "
stashed = "􀈭 Stashed "
modified = "􀈎 Modified "
staged = "􀃲 Staged "
renamed = "􀈎 Renamed "
deleted = "􀈑 Deleted "

[golang]
symbol = "Golang "

[helm]
symbol = "Helm "

# [hostname]

[java]
symbol = "Java "

[jobs]
symbol = "Jobs "

[julia]
symbol = "Julia "

[kotlin]
symbol = "Kotlin "

[kubernetes]
symbol = "Kubernetes "

# [line_break]
# disabled = true

[lua]
symbol = "Lua "

[memory_usage]
symbol = "􀫦  "
# disabled = false
# threshold = 0

[hg_branch]
symbol = "Mercurial 􀙠 "
# disabled = false

[nim]
symbol = "Nim "

[nix_shell]
symbol = "Nix-shell "

[nodejs]
symbol = "Node.js "

[ocaml]
symbol = "OCaml "

[openstack]
symbol = "OpenStack "

[package]
symbol = "􀐚 "

[perl]
symbol = "Perl "

[php]
symbol = "PHP "

[purescript]
symbol = "PureScript "

[python]
symbol = "Python "
python_binary = "python3"

[rlang]
symbol = "R "

[red]
symbol = "Red "

[ruby]
symbol = "Ruby "

[rust]
symbol = "Rust "

[scala]
symbol = "Scala "

# [shell]
# disabled = false

[shlvl]
symbol = "􀏭 "
disabled = false
threshold = 2

[singularity]
symbol = "Singularity "

[status]
symbol = "􀒉 " # The symbol displayed on program error
not_executable_symbol = "􀒉 " # The symbol displayed when file isn't executable
not_found_symbol = "􀒉 " # The symbol displayed when the command can't be found
sigint_symbol = "􀅴 " # The symbol displayed on SIGINT (Ctrl + c)
signal_symbol = "􀅴 " # The symbol displayed on any signal
# disabled = false

[swift]
symbol = "􀫊 "

[terraform]
symbol = "Terraform "

[time]
format = "[􀐫 \$time](\$style) "
# disabled = false

[username]
format = "[􀉭 \$user](\$style) in "
# show_always = true

[vagrant]
symbol = "Vagrant "

[vlang]
symbol = "VLang "

# [VCSH]

[zig]
symbol = "Zig"
END

mkdir /root/.antigen
curl -L git.io/antigen > /root/.antigen/antigen.zsh
tee -a ~/.zshrc << END
setopt correctall
eval "\$(starship init zsh)"
source "/root/.antigen/antigen.zsh"
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "\$HOME/.cache/zsh/.zcompcache"
zstyle ':completion:*' complete true
zle -C alias-expension complete-word _generic
bindkey '^A' alias-expension
zstyle ':completion:alias-expension:*' completer _expand_alias
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:*:*:corrections' format '%F{magenta}􀒋 %d (errors: %e)%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}􀻒 %d%f'
zstyle ':completion:*:*:*:*:messages' format '%F{purple}􀌪 %d%f'
zstyle ':completion:*:*:*:*:warnings' format '%F{red}􀇾 no match%f'
zstyle ':completion:*:*:*:*:default' list-colors \${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix true
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(\${=\${\${(f)"\$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
END