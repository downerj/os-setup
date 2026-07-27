#!/usr/bin/env bash

termux-setup-storage
ln -s /storage/emulated/0 Internal
ln -s "$(realpath external-1/../../../..)" External
