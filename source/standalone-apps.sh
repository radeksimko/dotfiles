# Standalone apps

function INSTALL_DMG() {
  local install_type=$1
  local url=$2
  local app_filename=$3

  local id=`md5 -q -s "$url"`

  local downloadDir="$HOME/Downloads"
  local dmgLocation="$downloadDir/dotfiles-$id.dmg"
  local mountPoint="/Volumes/$id"

  local userAgent="Mozilla/1.22 (compatible; MSIE 10.0; Windows 3.1)"

  if [[ `IS_APP_INSTALLED "$app_filename"` -eq 1 ]]; then
    e_info "Application $app_filename is already installed"
    return
  fi

  local t=$install_type
  if [[ $t != '--copy_app' && $t != '--run_app' && $t != '--install_pkg' ]]; then
    e_error "Provide known type (copy_app, run_app, install_pkg)"
    return
  fi;

  if [[ ! -d "$downloadDir" ]]; then
    mkdir "$downloadDir"
    if [[ ! $? -eq 0 ]]; then
      e_error "Creating $downloadDir failed"
    fi
  fi

  e_arrow "Downloading DMG from $url to $dmgLocation"
  curl -s -f -A "$userAgent" -L "$url" 2>/tmp/df-stderr > $dmgLocation && e_info "DMG downloaded"
  if [[ ! $? -eq 0 ]]; then
    e_error "Downloading DMG failed\n `cat /tmp/df-stderr`"
    return
  fi

  e_arrow "Mounting DMG as $id"
  hdiutil attach -mountpoint /Volumes/$id $dmgLocation 2>/tmp/df-stderr && e_info "DMG mounted"
  if [[ ! $? -eq 0 ]]; then
    e_error "Mounting DMG failed\n `cat /tmp/df-stderr`"
    return
  fi

  if [[ $install_type == '--copy_app' ]]; then
    local apps=`ls $mountPoint | grep '.app'`
    e_arrow "Copying $apps to /Applications"
    cp -R "$mountPoint"/*.app /Applications/ && e_success "$app_filename installed"
    if [[ ! $? -eq 0 ]]; then
      e_error "Copying $apps failed"
      return
    fi
  elif [[ $install_type == '--run_app' ]]; then
    _RUN_APP_FROM_MOUNTPOINT $mountPoint "$app_filename"
  elif [[ $install_type == '--install_pkg' ]]; then
    e_arrow "Installing via pkg"
    sudo -S installer -verbose -pkg "$mountPoint"/*.pkg \
        -target "/Volumes/Macintosh HD" && e_success "$app_filename installed"
    if [[ ! $? -eq 0 ]]; then
      e_error "Installing $app_filename failed"
      return
    fi
  fi

  e_arrow "Unmounting DMG"
  hdiutil detach "$mountPoint" && e_info "DMG unmounted from $mountPoint"

  e_arrow "Deleting DMG"
  rm -f $dmgLocation && e_info "DMG at $dmgLocation deleted"
}

function _RUN_APP_FROM_MOUNTPOINT() {
  local mountPoint=$1
  local app_filename=$2

  e_arrow "Installing by opening app"
  sudo open -W "$mountPoint"/*.app 2>/tmp/df-stderr

  if [[ ! $? -eq 0 ]]; then
    e_error "Initiating installation failed (are you running without GUI?)"
    echo -e "    \033[0;31m`cat /tmp/df-stderr`\033[0m"
    return
  fi

  local needs_checking=`_PROMPT_BOOL_INPUT "Check that $app_filename has been installed or skip?" 'y' 's'`

  if [[ $needs_checking -eq 1 && `IS_APP_INSTALLED "$app_filename"` -eq 1 ]]; then
    e_success "$app_filename has been installed"
  elif [[ $needs_checking -eq 1 ]]; then
    e_error "$app_filename has not been installed"
    _RUN_APP_FROM_MOUNTPOINT "$mountPoint"
    return
  else
    e_info "Skipping $app_filename"
  fi
}

function UNZIP_APP() {
  local url=$1
  local app_filename=$2

  local id=`md5 -q -s "$url"`
  local downloadPath="$HOME/Downloads/dotfiles-$id.zip"

  if [[ `IS_APP_INSTALLED "$app_filename"` -eq 1 ]]; then
    e_info "Application $app_filename is already installed"
    return
  fi

  e_arrow "Downloading ZIP from $url"
  curl -L "$url" > "$downloadPath" && e_info "ZIP file downloaded"

  e_arrow "Unzipping content"
  unzip -q -o "$downloadPath" -d /Applications && e_success "$app_filename installed"

  e_arrow "Removing previously downloaded ZIP"
  rm -f "$downloadPath" && e_info "ZIP file removed"
}
