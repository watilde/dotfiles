# Build from Ubuntu stable
FROM ubuntu:16.04

# APT
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install \
  apt-utils \
  bash \
  curl \
  ccache \
  emacs \
  cmake \
  gdb \
  git \
  guile-2.0 \
  lldb \
  make \
  nmap \
  nodejs \
  npm \
  tmux \
  vim \
  wget

RUN apt-get clean

# Dotfiles
WORKDIR /root
RUN git clone https://github.com/watilde/dotfiles.git .chest

WORKDIR /root/.chest
RUN alias node=nodejs
RUN npm install
RUN npm run submodule-update

WORKDIR /root
RUN /root/.chest/node_modules/.bin/chest open
RUN bash .bash/init.sh

# Run with bash
CMD ["bash"]
