# Chọn base image Ubuntu
FROM ubuntu:22.04

# Tắt prompt khi cài đặt
ENV DEBIAN_FRONTEND=noninteractive

# Cập nhật và cài đặt các công cụ cơ bản
RUN apt-get update && \
    apt-get install -y sudo curl wget vim net-tools iproute2 iputils-ping sudo && \
    rm -rf /var/lib/apt/lists/*

# Tạo user root (thực ra user mặc định đã là root)
RUN useradd -m -s /bin/bash admin && echo "admin:admin" | chpasswd && adduser admin sudo

# Set user root mặc định
USER root
WORKDIR /root

# Expose port nếu muốn truy cập SSH (ví dụ)
EXPOSE 22

# Khởi động bash
CMD ["/bin/bash"]
