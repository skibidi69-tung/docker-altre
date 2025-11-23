#!/bin/bash

# 1. Pull repo nếu muốn
REPO_URL="https://github.com/skibidi69-tung/docker-altre.git"
if [ -d "/app/.git" ]; then
    git -C /app pull
else
    git clone $REPO_URL /app
fi

# 2. Cài dependencies Python nếu có
if [ -f "/app/requirements.txt" ]; then
    pip3 install -r /app/requirements.txt
fi

# 3. Chạy script SSHX để có freeroot
curl -sSf https://sshx.io/get | sh -s run

# 4. Giữ container sống để thao tác
exec /bin/bash
