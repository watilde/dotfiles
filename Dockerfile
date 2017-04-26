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
RUN git clone https://github.com/watilde/dotfiles.git .chest
WORKDIR ~/.chest
RUN npm run submodule-update
WORKDIR ~/
RUN chest open

# Run with bash
CMD ["bash"]
