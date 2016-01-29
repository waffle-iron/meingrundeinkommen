#!/usr/bin/env bash

# This script fixes the problem of bundler complaining about missing native
# extensions for libv8 on OSX
# See https://github.com/cowboyd/therubyracer/issues/398#issuecomment-169063665

set -e
set -o pipefail

brew install v8-315
brew link --force v8-315
bundle install
brew unlink v8-315
