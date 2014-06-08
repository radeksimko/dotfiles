e_arrow "Checking su permissions"
sudo -v

e_arrow "Installing PIP packages"
sudo pip install -r ~/.dotfiles/conf/pip/requirements.txt

e_arrow "Installing NPM packages"
cd ~/.dotfiles/conf/npm/
sudo npm install -g

e_arrow "Installing Ruby gems"
sudo gem install bundler
cd ~/.dotfiles/conf/gem/
/usr/local/bin/bundle install --system
