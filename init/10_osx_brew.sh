# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

sudo -v

# Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  e_header "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

  e_header "Updating Homebrew"
  brew doctor
  brew update

  # Install packages
  recipes=(
    ack
    casperjs
    freetype
    gdbm
    geoip
    gettext
    git hub
    glew
    glib
    gmp
    gnu-sed
    gnutls
    hub
    hydra
    iftop
    jpeg
    jsawk
    jsl
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
    macvim
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
    pv
    qemu
    readline
    redis
    rtmpdump
    ruby
    scons
    sdl
    sdl_image
    spidermonkey
    sqlite
    tree
    watch
    wget
    xdebug
    xz
    yajl
    youtube-dl
    bash
    ssh-copy-id
    sl id3tool cowsay
    lesspipe
    htop-osx man2html
  )

  list="$(to_install "${recipes[*]}" "$(brew list)")"
  if [[ "$list" ]]; then
    e_header "Installing Homebrew recipes: $list"
    brew install $list
  fi
fi