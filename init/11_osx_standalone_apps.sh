# Google Chrome
INSTALL_DMG --copy_app 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg' 'Google Chrome.app'

# Firefox
INSTALL_DMG --copy_app 'https://download.mozilla.org/?product=firefox-27.0.1-SSL&os=osx&lang=en-US' 'Firefox.app'

# Android File Transfer
INSTALL_DMG --copy_app 'https://dl.google.com/dl/androidjumper/mtp/current/androidfiletransfer.dmg' 'Android File Transfer.app'

# Adium
INSTALL_DMG --copy_app "http://downloads.sourceforge.net/project/adium/Adium_1.5.9.dmg?r=&ts=`date +"%s"`&use_mirror=garr" 'Adium.app'

# Google Drive
INSTALL_DMG --copy_app 'https://dl.google.com/drive/installgoogledrive.dmg' 'Google Drive.app'

# VLC
INSTALL_DMG --copy_app 'http://videolan.mirrors.uk2.net/vlc/2.1.4/macosx/vlc-2.1.4.dmg' 'VLC.app'

# SourceTree
INSTALL_DMG --copy_app 'http://downloads.atlassian.com/software/sourcetree/SourceTree_1.9.1.dmg' 'SourceTree.app'

# Sublime Text
INSTALL_DMG --copy_app 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203059.dmg' 'Sublime Text.app'

# Disk Inventory X
INSTALL_DMG --copy_app 'http://www.alice-dsl.net/tjark.derlien/DIX1.0Universal.dmg' 'Disk Inventory X.app'

# Skype
INSTALL_DMG --copy_app 'http://download.skype.com/macosx/Skype_6.15.0.330.dmg' 'Skype.app'

# Viscosity
INSTALL_DMG --copy_app 'http://www.sparklabs.com/downloads/Viscosity.dmg' 'Viscosity.app'

# CleanMyMac
INSTALL_DMG --copy_app 'http://dl.devmate.com/com.macpaw.CleanMyMac2/CleanMyMac2.dmg' 'CleanMyMac 2.app'

# Virtualbox
INSTALL_DMG --install_pkg 'http://download.virtualbox.org/virtualbox/4.3.8/VirtualBox-4.3.8-92456-OSX.dmg' 'VirtualBox.app'

# Vagrant
INSTALL_DMG --install_pkg 'https://dl.bintray.com/mitchellh/vagrant/Vagrant-1.4.0.dmg' 'Vagrant'

# Last.fm
UNZIP_APP 'http://www.last.fm/download/mac' 'Last.fm.app'

# iTerm
UNZIP_APP 'http://www.iterm2.com/nightly/latest' 'iTerm.app'

# Adobe Reader
INSTALL_DMG --run_app 'http://aihdownload.adobe.com/bin/live/AdobeReaderInstaller_11_uk_ltrosxd_aaa_aih.dmg' 'Adobe Reader.app'

# Dropbox
INSTALL_DMG --run_app 'https://www.dropbox.com/download?src=index&plat=mac' 'Dropbox.app'
