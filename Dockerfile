# Build from Ubuntu stable
FROM ubuntu:16.04

# APT
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install \
  autoconf \
  automake \
  apt-utils \
  bash \
  curl \
  ccache \
  emacs \
  cmake \
  gdb \
  git \
  guile-2.0 \
  irssi \
  libboost-all-dev \
  libtool \
  lldb \
  lua \
  make \
  nmap \
  nodejs \
  npm \
  sar \
  tcpdump \
  tmux \
  traceroute \
  vim \
  wget

RUN apt-get clean

# Dotfiles
WORKDIR /root
RUN git clone https://github.com/watilde/dotfiles.git .chest

WORKDIR /root/.chest
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install
RUN npm run submodule-init

WORKDIR /root
RUN mv .bashrc .bashrc.default
RUN /root/.chest/node_modules/.bin/chest open

# Run with bash
CMD ["bash"]
