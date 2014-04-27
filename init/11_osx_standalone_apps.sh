# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

e_header "Installing standalone apps"

sudo -v

function INSTALL_DMG() {
  local install_type=$1
  local url=$2
  local id=`md5 -s $url`
  local dmgLocation="$HOME/Downloads/dotfiles-$id.dmg"

  e_arrow "Downloading DMG from $url"
  curl $url > $dmgLocation
  e_arrow "Mounting DMG"
  hdiutil attach -mountpoint $id $dmgLocation

  if [[ $install_type == '--copy_app' ]]; then
    e_arrow "Installing by copying app"
    cp -R /Volumes/$id/*.app /Applications/
  elif [[ $install_type == '--run_app' ]]; then
    e_arrow "Installing by opening app"
    open /Volumes/$id/*.app
  elif [[ $install_type == '--install_pkg' ]]; then
    e_arrow "Installing via pkg"
    sudo -S installer -verbose -pkg *.pkg -target /
  else
    e_error "Provide known install_type"
  fi;

  e_arrow "Unmounting DMG"
  hdiutil detach "/Volumes/$id"
  e_arrow "Deleting DMG"
  rm -f $dmgLocation
}

function UNZIP_APP() {
  local url, id
  url=$1
  id=`md5 -s $url`

  e_arrow "Downloading ZIP from $url"
  curl $url > ~/Downloads/dotfiles-$id.zip
  e_arrow "Unzipping content"
  unzip $1 -d /Applications
  e_arrow "Removing previously downloaded ZIP"
  rm -f ~/Downloads/dotfiles-$id.zip
}

# Google Chrome
INSTALL_DMG --copy_app https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg

# Firefox
INSTALL_DMG --copy_app 'https://download.mozilla.org/?product=firefox-27.0.1-SSL&os=osx&lang=en-US'

# Opera
INSTALL_DMG --just_mount 'http://www.opera.com/download/get/?id=36437&location=360&nothanks=yes&sub=marine'

# Adobe Reader
#https://get.adobe.com/uk/reader/download/?installer=Reader_11.0.06_English_UK_for_Mac_Intel&os=OSX&browser_type=KHTML&browser_dist=Chrome&d=Adobe_Photoshop_Lightroom_for_Macintosh&dualoffer=false

# Flash Player

# Android File Transfer
INSTALL_DMG --copy_app https://dl.google.com/dl/androidjumper/mtp/current/androidfiletransfer.dmg

# Adium
INSTALL_DMG --copy_app http://kent.dl.sourceforge.net/project/adium/Adium_1.5.9.dmg

# Google Drive
INSTALL_DMG --copy_app https://dl.google.com/drive/installgoogledrive.dmg

# Last.fm
UNZIP_APP http://www.last.fm/download/mac

# VLC
INSTALL_DMG --copy_app http://videolan.mirrors.uk2.net/vlc/2.1.4/macosx/vlc-2.1.4.dmg

# iTerm
UNZIP_APP http://www.iterm2.com/nightly/latest

# Virtualbox
INSTALL_DMG --install_pkg http://download.virtualbox.org/virtualbox/4.3.8/VirtualBox-4.3.8-92456-OSX.dmg

# Vagrant
INSTALL_DMG --install_pkg https://dl.bintray.com/mitchellh/vagrant/Vagrant-1.4.0.dmg

# Dropbox
INSTALL_DMG --run_app 'https://www.dropbox.com/download?src=index&plat=mac'
