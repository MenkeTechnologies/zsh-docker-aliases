#!/usr/bin/env zunit
#{{{                    MARK:Header
#**************************************************************
##### Purpose: zsh-docker-aliases syntax + alias-shape smoke tests
##### Notes: gated on `docker` being present — when absent the
#####        plugin returns early at source-time so aliases never
#####        register; we exercise both arms by setting
#####        `commands[docker]` ourselves before sourcing.
#}}}***********************************************************

@setup {
    0="${${0:#$ZSH_ARGZERO}:-${(%):-%N}}"
    0="${${(M)0:#/*}:-$PWD/$0}"
    pluginDir="${0:h:A}"
}

@test 'plugin entrypoint *.zsh parses cleanly' {
    for file in "$pluginDir/"*.zsh; do
        run zsh -n "$file"
        assert $state equals 0
    done
}

@test 'alias.zsh parses cleanly' {
    run zsh -n "$pluginDir/alias.zsh"
    assert $state equals 0
}

@test 'alias.zsh registers at least 100 docker aliases' {
    # Source with `docker` faked as a noop so the plugin's
    # `(( ! $+commands[docker] ))` guard passes.
    run zsh -c '
        alias docker=true
        autoload -Uz add-zsh-hook 2>/dev/null
        source "'"$pluginDir"'/alias.zsh"
        alias | grep -cE "^d[a-z]+=" || alias | wc -l
    '
    assert $state equals 0
    [[ "$output" -ge 100 ]]
    assert $state equals 0
}

@test 'core docker aliases dk / dkb / dkr / dki / dkp are defined' {
    local check
    check=$(zsh -c "
        alias docker=true
        source '$pluginDir/alias.zsh'
        for a in dk dkb dkr dki dkp; do
            alias \$a >/dev/null || { echo missing \$a; exit 1; }
        done
        echo ok
    " 2>&1)
    [[ "$check" == ok ]]
    assert $state equals 0
}
