# AppStore apps

function INSTALL_APPSTORE_APPS() {
  echo "$1" | xargs -L 1 bash -c 'PROMPT_APPSTORE_INSTALLATION "$0" "$@"'
}

function PROMPT_APPSTORE_INSTALLATION() {
  if [[ ! "$OSTYPE" =~ ^darwin ]]; then
    e_error "You can use Homebrew only on Mac OS X, this is $OSTYPE"
    continue
  fi

  local app_id=$1
  local app_filename=$2

  if [[ $app_id == '' || $app_filename == '' ]]; then
    e_error "Provide an app ID and a name"
    return
  fi

  if [[ $3 != '' ]]; then
    e_error "Have you forgotten to escape app name with space?\n    $@"
    return
  fi

  if [[ `IS_APP_INSTALLED "$app_filename"` -eq 1 ]]; then
    e_info "Application $app_filename is already installed"
    return
  fi


  e_info "Prompting installation of $app_filename"
  open "macappstore://itunes.apple.com/app/"$app_id"?mt=12" 2>/tmp/df-stderr
  if [[ ! $? -eq 0 ]]; then
    e_error "Initiating installation failed (are you running without GUI?)"
    echo -e "    \033[0;31m`cat /tmp/df-stderr`\033[0m"
    return
  fi

  local needs_checking=`_PROMPT_BOOL_INPUT "Check that app has been installed or skip?" 'y' 's'`

  if [[ $needs_checking -eq 1 && `IS_APP_INSTALLED "$app_filename"` -eq 1 ]]; then
    e_success "$app_filename has been installed"
  elif [[ $needs_checking -eq 1 ]]; then
    e_error "$app_filename has not been installed"
    PROMPT_APPSTORE_INSTALLATION "$app_id" "$app_filename"
    return
  else
    e_info "Skipping $app_filename"
  fi
}

function _PROMPT_BOOL_INPUT() {
  local question=$1
  local positive=$2
  local negative=$3

  exec 0< /dev/tty

  while true; do
    read -p "$question ($positive/$negative) [$positive] " answer
    case $answer in
      $positive ) echo 1; break;;
      $negative ) echo 0; break;;
      '' ) echo 1; break;;
    esac
  done
}

function IS_APP_INSTALLED() {
  local filename="$1"

  if [[ -d "/Applications/$filename" ]]; then
    echo 1
    return
  fi

  echo 0
}

export -f PROMPT_APPSTORE_INSTALLATION _PROMPT_BOOL_INPUT IS_APP_INSTALLED
