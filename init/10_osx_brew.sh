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
  casperjs
  cowsay
  docker
  freetype
  gdbm
  geoip
  gettext
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
  pixman
  pkg-config
  python # = pip
  pv
  qemu # 16.5 min
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
  watch
  wget
  xz
  yajl
  youtube-dl
)

INSTALL_BREW_PACKAGES "${recipes[*]}"
