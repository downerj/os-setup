#!/usr/bin/env bash

# https://docs.scala-lang.org/getting-started/index.html
curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz \
  | gzip -d > cs \
  && chmod +x cs \
  && ./cs setup
