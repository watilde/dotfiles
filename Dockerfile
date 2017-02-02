# Build from Ubuntu stable
FROM ubuntu:16.04

# APT
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install \
  curl \
  bash \
  git \
  make
RUN apt-get clean

# Define working directory
RUN mkdir ~/Development
WORKDIR ~/Development

# Run with bash
CMD ["bash"]
