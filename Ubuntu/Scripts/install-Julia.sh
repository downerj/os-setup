#!/usr/bin/env bash

pushd /tmp
curl -f -L -R -s -S https://install.julialang.org > install-julia.sh
chmod +x install-julia.sh
./install-julia.sh && rm -f -v install-julia.sh
popd
