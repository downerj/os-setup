#!/usr/bin/env bash

# Alternative Ruby+Mise+Rails install instructions:
# https://guides.rubyonrails.org/install_ruby_on_rails.html

# Note: The following must be installed before continuing:
# build-essential ruby ruby-bundler ruby-dev rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev

gem install --user-install rails
bundle config set --local path "$HOME/.local/share/gem"
