# syntax=docker/dockerfile:1.3-labs
from debian:bullseye

RUN apt-get update && apt-get install -y \
    build-essential \
    libcurl4-openssl-dev \
    liblzma-dev \
    git  \
    python3 \
    python3-pip \
    git-lfs \
    python-dev-is-python3 \
    libssl-dev \
    gcc \
    g++ \
 && rm -rf /var/lib/apt/lists/*
