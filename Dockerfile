# Start from the NVIDIA CUDA base image for Ubuntu 22.04
FROM nvidia/cuda:11.8.0-base-ubuntu22.04

# Avoid prompts from apt during installation
ARG DEBIAN_FRONTEND=noninteractive

# Install build essentials, X11 development files, and other dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    ninja-build \
    git \
    tree \
    wget \
    libx11-dev \        
    libxrandr-dev \     
    libxinerama-dev \   
    libxcursor-dev \    
    libxi-dev \
    libgl1-mesa-dev

# Download and install CMake 3.24
RUN wget https://github.com/Kitware/CMake/releases/download/v3.24.0/cmake-3.24.0-linux-x86_64.sh -q -O /tmp/cmake-install.sh && \
    chmod +x /tmp/cmake-install.sh && \
    /tmp/cmake-install.sh --skip-license --prefix=/usr/local && \
    rm /tmp/cmake-install.sh

# Set the working directory to /code
WORKDIR /code

# Set environment variables for GUI apps
# ENV DISPLAY=host.docker.internal:0.0

# Copy your project files into the container
COPY . .
