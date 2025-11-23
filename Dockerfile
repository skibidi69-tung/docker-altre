# Base image
FROM ubuntu:22.04

# Tắt prompt khi cài đặt
ENV DEBIAN_FRONTEND=noninteractive

# Cập nhật và cài đặt công cụ cơ bản
RUN apt-get update && \
    apt-get install -y sudo curl wget vim net-tools iproute2 iputils-ping && \
    rm -rf /var/lib/apt/lists/*

# Tạo group với GID 988 để tránh lỗi
RUN groupadd -g 988 mygroup

# Tạo user và thêm vào group
RUN useradd -m -s /bin/bash -g 988 admin && \
    echo "admin:admin" | chpasswd && \
    adduser admin sudo

# Chọn user mặc định
USER root
WORKDIR /root

# Expose port nếu muốn (ví dụ SSH)
EXPOSE 22

# Khởi động bash
CMD ["/bin/bash"]
