# AppStore apps

apps=`cat <<LIST
  twitter/id409789998 Twitter.app
  growl/id467939042 Growl.app
  window-magnet/id441258766 "Window Magnet.app"
  xcode/id497799835 Xcode.app
LIST`

INSTALL_APPSTORE_APPS "$apps"
