# Base image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Cài gói cơ bản + Python3 + pip + curl
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    vim \
    sudo \
    python3 \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Chạy container với root
USER root
WORKDIR /app

# Copy script start
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Command mặc định
CMD ["/usr/local/bin/start.sh"]
