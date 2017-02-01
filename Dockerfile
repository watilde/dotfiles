# Build from Ubuntu stable
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install curl bash

# Define working directory
RUN mkdir ~/Development
WORKDIR ~/Development

# Run with bash
CMD ["bash"]
