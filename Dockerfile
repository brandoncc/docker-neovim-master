FROM debian:stretch-slim

# install build packages and neovim build dependencies
RUN apt-get update && apt-get install --no-install-recommends -qq \
  build-essential gperf luajit luarocks libuv1-dev \
  libluajit-5.1-dev libunibilium-dev libmsgpack-dev libtermkey-dev \
  libvterm-dev libutf8proc-dev make cmake automake git gettext pkg-config \
  libtool-bin libtool curl ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# compile neovim
RUN git clone https://github.com/neovim/neovim && \
  cd neovim && \
  make CMAKE_BUILD_TYPE=RelWithDebInfo && \
  make install

WORKDIR /usr/src

RUN curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
