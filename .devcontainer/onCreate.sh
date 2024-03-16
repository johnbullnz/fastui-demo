#!/bin/bash

## Setup script run inside the development Docker container after creation.

# Install Github CLI:
cd /root
type -p curl >/dev/null || (apt update && apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& apt update \
&& apt install gh -y

# Install nano editor and set as git editor:
apt update && apt install nano -y
export GIT_EDITOR=nano

# Install poetry:
python3 -m pip install poetry

# Create a virtual environment for development:
cd /workspaces/fastui-app
python3 -m venv venv
source venv/bin/activate

# Install requirements:
poetry install

# Install pre-commit hooks:
# pre-commit install