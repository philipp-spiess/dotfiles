function git_fast_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

    local dirty
    if [[ $(git diff --stat) != '' ]]; then
      dirty=$ZSH_THEME_VCS_PROMPT_DIRTY
    else
      dirty=$ZSH_THEME_VCS_PROMPT_CLEAN
    fi

    echo "🐙$ZSH_THEME_VCS_PROMPT_PREFIX${ref#refs/heads/}$dirty$ZSH_THEME_VCS_PROMPT_SUFFIX"
  fi
}

function sl_prompt_info() {
  local ref
  ref=$(command sl log -l 1 -T "{desc}\n" 2>/dev/null | head -n 1 | sed 's/\(.\{20\}\).*/\1…/') || return 0

  if [[ $ref != '' ]]; then
    local dirty
    if [[ $(sl status) != '' ]]; then
      dirty=$ZSH_THEME_VCS_PROMPT_DIRTY
    else
      dirty=$ZSH_THEME_VCS_PROMPT_CLEAN
    fi

    echo "🌱$ZSH_THEME_VCS_PROMPT_PREFIX${ref}$dirty$ZSH_THEME_VCS_PROMPT_SUFFIX"
  fi
}

local ret_status="%(?:%{$FG[245]%}$MACHINE_NAME:%{$FG[204]%}$MACHINE_NAME)"

PROMPT='${ret_status} %{$FG[228]%}%2d%{$reset_color%} $(git_fast_prompt_info)'

ZSH_THEME_VCS_PROMPT_PREFIX="%{$FG[245]%}("
ZSH_THEME_VCS_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_VCS_PROMPT_DIRTY=")%{$FG[228]%}✗"
ZSH_THEME_VCS_PROMPT_CLEAN=")"
