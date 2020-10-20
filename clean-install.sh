#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# run homebrew installs
./brew.sh

# configure Mac settings
./.macos
