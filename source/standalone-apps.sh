# Standalone apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

function ENSURE_CASK_IS_INSTALLED() {
  if [[ ! "$OSTYPE" =~ ^darwin ]]; then
    e_error "You can use Cask only on Mac OS X, this is $OSTYPE"
    continue
  elif [[ ! "$(type -P brew)" ]]; then
    e_error "Homebrew must be installed before installing Cask"
    continue
  fi

  taps=(
    caskroom/cask
    caskroom/versions
  )
  TAP_BREW_REPOS "${taps[*]}"

  if [[ "$(brew cask 2>/dev/null && echo 1)" ]]; then
    e_info "Cask is already installed"
    return
  fi

  e_info "Installing Cask will require superuser privileges"
  e_arrow "Enter your sudo password, please:"
  sudo -v

  if [[ $? != 0 ]]; then
    e_error "No sudo password provided"
    continue
  fi

  e_subheader "Installing Cask"
  brew install brew-cask
}

function INSTALL_CASK_PACKAGES() {
  local packages=$1

  if [[ ! "$packages" ]]; then
    e_error "Provide the list of packages as an argument"
    continue
  fi

  ENSURE_CASK_IS_INSTALLED

  local list="$(to_install "${packages[*]}" "$(brew cask list)")"
  if [[ "$list" ]]; then
    e_subheader "Installing Cask packages: $list"
    brew cask install $list
  fi
}