taps=(
  homebrew/binary
  homebrew/completions
)

TAP_BREW_REPOS "${taps[*]}"

recipes=(
  ack
  android-platform-tools # = adb
  ant
  bash
  bash-completion
  bundler-completion
  casperjs
  cowsay
  django-completion
  docker
  freetype
  gdbm
  gem-completion
  geoip
  gettext
  git # OSX builtin is too old and w/out completition
  glew
  glib
  gmp
  gnu-sed
  gnutls
  graphviz
  packer
  htop-osx
  hub
  hydra
  id3tool
  iftop
  jpeg
  jsawk
  lesspipe
  libffi
  libgcrypt
  libgpg-error
  libident
  libtasn1
  libtool
  libvirt
  libxml2
  libxslt
  libyaml
  links
  man2html
  maven
  maven-shell
  mercurial
  mongodb
  mtr
  nettle
  nmap
  node
  nspr
  openssl
  ossp-uuid
  p11-kit
  pcre
  phantomjs
  pip-completion
  pixman
  pkg-config
  python # = pip
  pv
  qemu # 16.5 min
  rake-completion
  readline
  redis
  rtmpdump
  ruby # I don't want to bother /w RVM nor OSX builtin Ruby
  scons
  sdl
  sdl_image
  sl
  spidermonkey # 5.1min
  sqlite
  ssh-copy-id
  tree
  vagrant-completion
  watch
  wget
  xz
  yajl
  youtube-dl
)

INSTALL_BREW_PACKAGES "${recipes[*]}"
