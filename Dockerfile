#################### Build-System Image ####################
FROM ubuntu:20.04 AS build-system

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
    apt-utils \
    python3 \
    python3-pip \
    git \
    clang\
    make\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#Set sym links to tools
RUN ln -s /usr/bin/python3 /usr/bin/python \
    && rm -rf /usr/bin/pip \
    && ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip install cmake \
    && pip install conan
#
#
# Add
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID
#
# Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME
#
# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
#Switch back to dialog
ENV DEBIAN_FRONTEND=dialog
