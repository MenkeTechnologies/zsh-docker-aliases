#!/usr/bin/env zunit
#{{{                    MARK:Header
##### Purpose: zsh-docker-aliases — plugin-contract pins.
#####          Entrypoint stem matches plugin dir (typical
#####          zsh-plugin install pattern), entrypoint parses
#####          cleanly under `zsh -n`, and (where applicable)
#####          every completion file starts with `#compdef`.
#}}}***********************************************************

@setup {
    0="${${0:#$ZSH_ARGZERO}:-${(%):-%N}}"
    0="${${(M)0:#/*}:-$PWD/$0}"
    pluginDir="${0:h:A}"
}

@test 'entrypoint stem matches plugin directory basename' {
    # The standard zsh-plugin install pattern (oh-my-zsh, zinit,
    # antibody, antigen) sources `<repo>/<repo>.plugin.zsh`. The
    # stem of `docker-aliases.plugin.zsh` must equal the parent directory's
    # basename so generated source lines stay copy-pasteable.
    local entry='docker-aliases.plugin.zsh'
    local stem="${entry%.plugin.zsh}"
    local dir="${pluginDir##*/}"
    # Accept either exact match or `zsh-` prefix on dir (some repos
    # like `docker-aliases.plugin.zsh` live under `zsh-docker-aliases`).
    [[ "$stem" == "$dir" || "zsh-$stem" == "$dir" ]]
    assert $state equals 0
}

@test 'entrypoint parses cleanly under zsh -n' {
    run zsh -n "$pluginDir/docker-aliases.plugin.zsh"
    assert $state equals 0
}

@test 'every completion file starts with #compdef directive' {
    # Pass trivially when there are no `_*` files; otherwise every
    # one must lead with `#compdef`. A missing directive silently
    # disables completion. Use `find` so a zero-match doesn't trip
    # nomatch under EXTENDED_GLOB.
    local missing=""
    local d f
    for d in "$pluginDir/completions" "$pluginDir"; do
        [[ -d "$d" ]] || continue
        while IFS= read -r f; do
            [[ -f "$f" ]] || continue
            run head -1 "$f"
            [[ "$output" =~ ^#compdef ]] || missing="$missing ${f##*/}"
        done < <(find "$d" -maxdepth 1 -name "_*" -type f 2>/dev/null)
    done
    assert "$missing" is_empty
}

#--------------------------------------------------------------
# Round 2: docker-aliases module contract pins
#--------------------------------------------------------------

@test 'plugin returns early when docker binary is missing (guards $+commands[docker])' {
    # Pin: if docker isn't installed, sourcing must abort gracefully
    # rather than emit errors when subsequent aliases try to invoke it.
    local body
    body=$(cat "$pluginDir/docker-aliases.plugin.zsh")
    assert "$body" contains '$+commands[docker]'
    assert "$body" contains 'return 1'
}

@test 'plugin sources alias.zsh at the end via ${0:h}/alias.zsh' {
    # The aliases live in alias.zsh; the entrypoint must source it
    # via the relative-to-script form so the plugin works under any
    # plugin manager.
    local body
    body=$(cat "$pluginDir/docker-aliases.plugin.zsh")
    assert "$body" contains '${0:h}/alias.zsh'
}

@test 'dkme / dkmd functions guard against missing docker-machine' {
    # The two docker-machine helpers both check $+commands[docker-machine];
    # without the guard, calling them on a fresh box would silently
    # leak `eval $(docker-machine env ...)` errors into the user's shell.
    local body
    body=$(cat "$pluginDir/docker-aliases.plugin.zsh")
    assert "$body" contains 'function dkme'
    assert "$body" contains 'function dkmd'
    assert "$body" contains '$+commands[docker-machine]'
}

@test 'alias.zsh holds 100+ Docker shorthands' {
    # The plugin's value proposition is the alias volume; pin a
    # lower bound so accidental truncation surfaces.
    local count
    count=$(grep -c '^alias ' "$pluginDir/alias.zsh")
    [[ $count -ge 100 ]]
    assert $state equals 0
}
