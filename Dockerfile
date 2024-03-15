FROM python:3.12

EXPOSE 8000

# Set ENV environmnet variable:
ARG DEVELOPMENT=0
ENV DEVELOPMENT=${DEVELOPMENT}

# Set SHELL environment variable:
ENV SHELL=bash

# Copy custom .bashrc to set colorised terminal:
COPY .devcontainer/.bashrc /root/.bashrc

# Stop Python from generating .pyc files in the container and turn off buffering:
ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 

# Update system packages:
RUN apt-get update && apt-get upgrade -y

# Copy setup.sh and onCreate.sh (triggered in devcontainer.json) and update permissions:
COPY setup.sh /root/setup.sh
COPY .devcontainer/onCreate.sh /root/onCreate.sh
RUN chmod 777 /root/setup.sh /root/onCreate.sh

# Copy the package files (this is not used in the development container and is removed by the setup.sh script):
COPY fastui_demo /root/app/fastui_demo
COPY pyproject.toml /root/app/pyproject.toml
COPY README.md /root/app/README.md

# Update pip and setuptools:
RUN python3 -m pip install -U pip setuptools wheel

# Run setup.sh:
RUN /root/setup.sh

CMD [ "bash" ]
