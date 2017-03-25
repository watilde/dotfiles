# Build from Ubuntu stable
FROM ubuntu:16.04

# APT
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install \
  wget \
  curl \
  bash \
  git \
  make \
  gdb \
  lldb \
  ccache \
  yarn
RUN apt-get clean

# Define working directory
RUN mkdir ~/Development
WORKDIR ~/Development

# Run with bash
CMD ["bash"]
