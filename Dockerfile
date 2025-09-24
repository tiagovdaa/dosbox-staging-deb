FROM debian:trixie
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    pkg-config \
    libsdl2-dev \
    libsdl2-net-dev \
    libsdl2-image-dev \
    libpng-dev \
    libopus-dev \
    libfluidsynth-dev \
    libslirp-dev \
    libasound2-dev \
    libx11-dev \
    libxext-dev \
    libxrandr-dev \
    libvulkan-dev \
    ninja-build \
    git \
    cmake \
    libxcursor-dev \
    libxinerama-dev \
    libxi-dev \
    doxygen \
    g++-multilib \
    libfftw3-dev \
    libiir-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /dosbox-staging-src

# Disable Git's dubious ownership check
RUN git config --global --add safe.directory /dosbox-staging-src

COPY build.sh /build.sh
RUN chmod +x /build.sh