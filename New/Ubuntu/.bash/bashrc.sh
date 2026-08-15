#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

[[ -f "$HOME/.bash/bash_aliases.sh" ]] && source "$HOME/.bash/bash_aliases.sh"
[[ -f "$HOME/.bash/bash_options.sh" ]] && source "$HOME/.bash/bash_options.sh"
[[ -f "$HOME/.bash/bash_paths.sh" ]] && source "$HOME/.bash/bash_paths.sh"
[[ -f "$HOME/.bash/bash_prompt.sh" ]] && source "$HOME/.bash/bash_prompt.sh"
