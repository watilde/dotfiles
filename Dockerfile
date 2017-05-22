# Build from Debian stable
FROM debian:8.8

# APT
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install \
  aircrack-ng \
  autoconf \
  automake \
  apt-utils \
  arp-scan \
  bash \
  ccache \
  curl \
  coreutils \
  emacs \
  cmake \
  geoip-bin \
  geoip-database \
  gdb \
  git \
  guile-2.0 \
  iproute2 \
  irssi \
  libboost-all-dev \
  libtool \
  lldb \
  lua5.2 \
  macchanger \
  make \
  netcat \
  nethogs \
  net-tools \
  nmap \
  nodejs \
  npm \
  ophcrack \
  ruby-full \
  squid \
  tcpdump \
  tmux \
  tor \
  tor-arm \
  traceroute \
  vim \
  wireshark \
  wget

RUN apt-get clean

# Rust
RUN curl https://sh.rustup.rs -sSf | sh

# Go
RUN tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

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
