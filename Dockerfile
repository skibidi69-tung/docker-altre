# Custom Dockerfile for Pterodactyl Java 21 with root privileges

FROM ubuntu:22.04

# Switch to root user
USER root

# Install any required packages (optional)
RUN apt update && apt install -y sudo nano curl wget git && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /server

# Copy server files if needed
# COPY . /server

# Fix permissions
RUN chmod -R 755 /server

# Default startup command (can be overridden by panel)
# Default command can be overridden by panel
CMD ["python3", "app.py"]
