FROM python:3.8.9-slim-buster

RUN apt-get update \
    && apt-get install -y \
    curl \
    git \
    make \
    sudo \
    vim \
    tk-dev \
    powerline \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

### python module installation
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir --upgrade setuptools 
RUN pip install --no-cache-dir -U pip setuptools wheel \
    && pip install --no-cache-dir -r /tmp/requirements.txt

### .bashrc alias copy
COPY ./.alias /root
RUN cat /root/.alias >> /root/.bashrc
