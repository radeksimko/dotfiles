# AppStore apps

apps=`cat <<LIST
  the-unarchiver/id425424353 "The Unarchiver.app"
  twitter/id409789998 Twitter.app
  battery-time-remaining/id551420833 "Battery Time Remaining.app"
  growl/id467939042 Growl.app
  sourcetree-git-hg/id411678673 SourceTree.app
  window-magnet/id441258766 "Window Magnet.app"
  caffeine/id411246225 Caffeine.app
LIST`

INSTALL_APPSTORE_APPS "$apps"
