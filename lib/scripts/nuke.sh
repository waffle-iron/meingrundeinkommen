#!/usr/bin/env bash

# Nuke rbenv installed ruby, delete local bundles and restart from scratch
set -e
set -o pipefail

local_ruby="$(cat .ruby-version)"
installed_rubies="$(rbenv versions --bare)"

function nuke(){
  if [[ $installed_rubies == *${local_ruby}* ]]
  then
    echo "Uninstalling ${local_ruby}"
    rbenv uninstall -f ${local_ruby}
  else
    echo "${local_ruby} is not installed."
  fi

  rm -rf ./vendor/bundle
  rbenv install "$(cat .ruby-version)"
  brew tap homebrew/versions
  brew link --force v8-315
  gem install bundle
  bundle install
  gem install therubyracer libv8
  brew unlink v8-315
}

while true; do
    read -p "This will completely nuke your rbenv ruby and associated gems AND your ./vendor/bundle
    This is to fix some specific problems on OSX.
    Are you sure you wish to continue? " yn
    case $yn in
        [Yy]* ) nuke ; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

