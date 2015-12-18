#!/usr/bin/env bash
_%%SCRIPT%%()
{
    local cur words coms opts
    COMPREPLY=()
    _get_comp_words_by_ref -n : cur words cword
    coms="%%COMMANDS%%"
    opts="%%SHARED_OPTIONS%%"

    if [[ $cword = 1 ]] ; then
        COMPREPLY=($(compgen -W "${coms}" -- ${cur}))
        __ltrim_colon_completions "$cur"

        return 0
    fi

    case "${words[1]}" in
        %%SWITCH_CONTENT%%
        esac

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))

    return 0;
}

complete -o default -F _%%SCRIPT%% %%SCRIPT%%