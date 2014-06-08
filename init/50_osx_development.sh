e_arrow "Checking su permissions"
sudo -v

e_arrow "Installing PIP packages"
sudo pip install -q -r ~/.dotfiles/conf/pip/requirements.txt

e_arrow "Installing NPM packages"
cd ~/.dotfiles/conf/npm/
sudo npm install -g

e_arrow "Installing Ruby gems"
sudo gem install -q bundler
cd ~/.dotfiles/conf/gem/
/usr/local/opt/ruby/bin/bundle install --system
