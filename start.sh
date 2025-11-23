#!/bin/bash

REPO_URL="https://github.com/skibidi69-tung/docker-altre.git"

# Nếu đã có repo thì pull, nếu chưa thì clone
if [ -d "/app/.git" ]; then
    git -C /app pull
else
    git clone $REPO_URL /app
fi

# Cài dependencies Python nếu có
if [ -f "/app/requirements.txt" ]; then
    pip3 install -r /app/requirements.txt
fi

# Chạy bash
exec /bin/bash
