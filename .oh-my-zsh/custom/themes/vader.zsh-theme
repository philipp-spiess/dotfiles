local ret_status="%(?:%{$FG[245]%}$MACHINE_NAME:%{$FG[204]%}$MACHINE_NAME)"
PROMPT='${ret_status} %{$FG[228]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[245]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=")%{$FG[228]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=")"
