FROM node:14

WORKDIR /usr/src

# install build packages and neovim build dependencies
RUN apt-get update && apt-get install -y \
  build-essential libssl-dev snapd gperf luajit luarocks libuv1-dev \
  libluajit-5.1-dev libunibilium-dev libmsgpack-dev libtermkey-dev \
  libvterm-dev libutf8proc-dev

# install cmake so we can compile neovim
RUN wget https://github.com/Kitware/CMake/releases/download/v3.16.5/cmake-3.16.5.tar.gz && \
  tar -zxvf cmake-3.16.5.tar.gz && \
  cd cmake-3.16.5 && \
  ./bootstrap && \
  make  && \
  make install

RUN apt-get install -y gettext

# compile neovim
RUN git clone https://github.com/neovim/neovim && \
  cd neovim && \
  make CMAKE_BUILD_TYPE=RelWithDebInfo && \
  make install

