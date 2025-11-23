#!/bin/bash

REPO_URL="https://github.com/skibidi69-tung/docker-altre.git"

if [ -d "/app/.git" ]; then
    git -C /app pull
else
    git clone $REPO_URL /app
fi

if [ -f "/app/requirements.txt" ]; then
    pip3 install -r /app/requirements.txt
fi

exec /bin/bash
