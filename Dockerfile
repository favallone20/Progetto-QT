# Use ubuntu as base
FROM ubuntu:22.04

# Set the timezone, otherwise during the image creation
#the user has to interact with the machine.
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime && \
    apt-get update && apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Update pkgs and install the dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    wget \
    git \
    qtbase5-dev \
    qt5-qmake \
    qtcreator \
    qtchooser \
    qttools5-dev-tools \
    libqt5svg5-dev \
    libqt5widgets5 \
    gdb \
    && rm -rf /var/lib/apt/lists/*

# Define the working directory
WORKDIR /usr/src/app

# Add the folder to the list of "safe" directories in 
# Git's gloabl configuration
RUN git config --global --add safe.directory /usr/src/app

RUN apt update

# Default command: bash
CMD ["/bin/bash"]