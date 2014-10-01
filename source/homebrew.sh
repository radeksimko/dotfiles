# Homebrew.

function ENSURE_BREW_IS_INSTALLED() {
  if [[ ! "$OSTYPE" =~ ^darwin ]]; then
    e_error "You can use Homebrew only on Mac OS X, this is $OSTYPE"
    continue
  elif [[ "$(type -P brew)" ]]; then
    e_info "Homebrew is already installed"
    return
  fi

  e_info "Installing Homebrew will require superuser privileges"
  e_arrow "Enter your sudo password, please:"
  sudo -v

  if [[ $? != 0 ]]; then
    e_error "No sudo password provided"
    continue
  fi

  e_subheader "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  e_arrow "Checking potential issues (brew doctor)"
  brew doctor

  e_arrow "Updating the brew index"
  brew update
}

function INSTALL_BREW_PACKAGES() {
  local recipes=$1

  if [[ ! "$recipes" ]]; then
    e_error "Provide the list of recipes (packages) as an argument"
    continue
  fi

  ENSURE_BREW_IS_INSTALLED

  local list="$(to_install "${recipes[*]}" "$(brew list)")"
  if [[ "$list" ]]; then
    e_subheader "Installing Homebrew recipes: $list"
    brew install $list
  fi
}

function TAP_BREW_REPOS() {
  local taps=$1

  if [[ ! "$taps" ]]; then
    e_error "Provide the list of taps (repositories) as an argument"
    continue
  fi

  ENSURE_BREW_IS_INSTALLED

  local list="$(to_install "${taps[*]}" "$(brew tap)")"
  if [[ "$list" ]]; then
    e_subheader "Installing Homebrew taps: $list"
    for tap in $list; do
      brew tap $tap
    done
  fi
}
