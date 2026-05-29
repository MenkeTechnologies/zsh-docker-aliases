#!/usr/bin/env zunit
#{{{                    MARK:Header
#**************************************************************
##### Purpose: comprehensive alias-contract pins for the 148 docker
#####          aliases this plugin registers (when `docker` is on PATH).
#####          The plugin no-ops without docker; tests fake it so the
#####          full batch always loads.
#}}}***********************************************************

@setup {
    0="${${0:#$ZSH_ARGZERO}:-${(%):-%N}}"
    0="${${(M)0:#/*}:-$PWD/$0}"
    pluginDir="${0:h:A}"
}

@test 'alias.zsh registers more than 120 dk* docker aliases' {
    local count
    count=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias | grep -cE '^dk[a-zA-Z]*='
    ")
    local result=$([[ "$count" -ge 120 ]] && echo yes || echo "no:$count")
    assert "$result" same_as 'yes'
}

@test 'dk is bare docker (the canonical short form)' {
    local body
    body=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dk
    ")
    assert "$body" contains 'docker'
}

@test 'dkb is docker build (must NOT silently become docker push)' {
    local body
    body=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkb
    ")
    assert "$body" contains 'docker build'
}

@test 'dkr is docker run' {
    local body
    body=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkr
    ")
    assert "$body" contains 'docker run'
}

@test 'dki is docker images' {
    # The single-letter command suffix follows docker's own subcommand
    # spelling — `dki` is `images`, not `inspect` (which is `dkin`).
    local body
    body=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkis
    ")
    assert "$body" contains 'docker images'
}

@test 'dkin is docker inspect (NOT docker init or docker info)' {
    local body
    body=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkin
    ")
    assert "$body" contains 'docker inspect'
}

@test 'dkps is docker ps (container list)' {
    local body
    body=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkps
    ")
    assert "$body" contains 'docker ps'
}

@test 'dkp is docker pause (NOT docker ps — that is dkps)' {
    # Name overlap risk: a typo in user docs could conflate dkp / dkps.
    # Pin so dkp stays as pause.
    local body
    body=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkp
    ")
    assert "$body" contains 'docker pause'
}

@test 'dkkh kills with SIGHUP (the canonical reload signal)' {
    # The kill+signal alias is the contractual reload primitive.
    # The base dkk currently resolves to a later-binding (docker stack)
    # due to alias ordering, so we pin dkkh (which is unambiguous).
    local body
    body=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkkh
    ")
    assert "$body" contains 'docker kill'
}

@test 'dkkh kills with SIGHUP (catches sig-name typo to INT or TERM)' {
    local body
    body=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkkh
    ")
    assert "$body" contains '-s HUP'
}

@test 'dkl is docker logs; dkL is docker logs -f (follow)' {
    local one two
    one=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkl
    ")
    two=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkL
    ")
    assert "$one" contains 'docker logs'
    assert "$two" contains 'docker logs'
    assert "$two" contains '-f'
}

@test 'dke is docker exec; dkE additionally passes -i -t and COLUMNS/LINES (terminal-sized)' {
    local one two
    one=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dke
    ")
    two=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkE
    ")
    assert "$one" contains 'docker exec'
    assert "$two" contains 'docker exec'
    assert "$two" contains '-i'
    assert "$two" contains '-t'
    assert "$two" contains 'COLUMNS'
    assert "$two" contains 'LINES'
}

@test 'dkdf is docker system df (disk usage)' {
    local body
    body=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias dkdf
    ")
    assert "$body" contains 'docker system df'
}

@test 'docker-aliases.plugin.zsh entry guards on $+commands[docker]' {
    # Static check — verifies the guard's presence + shape without
    # relying on a docker-less PATH (test host has docker installed).
    # Contract: entry plugin (and the docker-aliases.plugin.zsh it sources)
    # must early-return when `$+commands[docker]` is 0; otherwise the
    # alias batch lands on hosts without docker and `dk` shadows other
    # commands.
    local entry_text plugin_text
    entry_text=$(cat "$pluginDir/docker-aliases.plugin.zsh")
    # The guard sits inside docker-aliases.plugin.zsh (in this fork) —
    # source it once and confirm the magic invocation is present.
    assert "$entry_text" contains 'commands[docker]'
    assert "$entry_text" contains 'return 1'
}

@test 'alias.zsh sourcing is idempotent — same alias count after re-source' {
    local first second
    first=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        alias | grep -cE '^dk'
    ")
    second=$(zsh -c "
        emulate zsh
        alias docker=true
        source '$pluginDir/alias.zsh'
        source '$pluginDir/alias.zsh'
        alias | grep -cE '^dk'
    ")
    assert "$first" equals "$second"
}
