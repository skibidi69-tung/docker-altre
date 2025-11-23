# Dùng Ubuntu mới nhất
FROM ubuntu:22.04

# Tránh tương tác khi cài đặt
ENV DEBIAN_FRONTEND=noninteractive

# Cài các gói cơ bản
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    wget \
    vim \
    python3 \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Thiết lập root
USER root

# Tạo thư mục chứa code
WORKDIR /app

# Copy script update repo vào container
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Command mặc định
CMD ["/usr/local/bin/start.sh"]
