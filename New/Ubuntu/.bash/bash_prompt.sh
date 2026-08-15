#!/usr/bin/env bash

function my_has_color {
  case "$TERM" in
    *-color|*-256color)
      echo -n 'true';;
    *)
      echo -n 'false';;
  esac
}

function my_datetime {
  #date +'%a %Y/%m/%d %H:%M:%S'
  date +'%m/%d %H:%M:%S'
}

function my_git_on {
  _my_git_on='true'
}

function my_git_off {
  unset _my_git_on
}


function my_git_write {
  if [[ "$_my_git_on" == 'true' ]]
  then
    local branch=$(git branch 2>/dev/null | grep -e ^* | sed -E s/\\\*\ \(.+\)$/\(\\\1\)\ /)
    if [[ ! -z "$branch" ]]
    then
      echo -n "$branch"
    else
      echo -n '(?) '
    fi
  else
    echo -n '--- '
  fi
}

function my_prompt_chevrons_color {
  local colors=("\[\e[95m\]" "\[\e[91m\]" "\[\e[93m\]" "\[\e[92m\]" "\[\e[96m\]" "\[\e[94m\]")
  local chevron='>'
  local chevrons=''
  for color in ${colors[@]}
  do
    chevrons="$chevrons$color$chevron"
  done
  echo -n "$chevrons"
}

function my_prompt_color {
  local date='\[\e[94m\]'"$(my_datetime)"
  local user='\[\e[91m\]\u'
  local at='\[\e[0m\]@'
  local host='\[\e[92m\]\H'
  local colon='\[\e[0m\]:'
  local dir='\[\e[96m\]\w'
  local lf='\[\e[0m\]\n'
  local git='\[\e[93m\]'"$(my_git_write)"
  local chevrons="$(my_prompt_chevrons_color)"
  local reset="\[\e[0m\]"
  PS1="$date $user$at$host$colon$dir$lf$git$chevrons$reset "
}

function my_prompt_no_color {
  PS1="$(my_datetime) \u@\H:\w\n$(my_git_write)>>>>>> "
}

function my_prompt {
  PROMPT_DIRTRIM=2
  if [[ $(my_has_color) == 'true' ]]
  then
    my_prompt_color
  else
    my_prompt_no_color
  fi
}

PROMPT_COMMAND="my_prompt"
