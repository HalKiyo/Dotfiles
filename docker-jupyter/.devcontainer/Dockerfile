FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=linux

# install linux modules
RUN apt update \
    && apt install -y \
    wget \
    bzip2 \
    git \
    curl \
    unzip \
    vim \
    powerline \
    file \
    xz-utils \
    sudo \
    python3-tk \
    python3-pip \
    python3-opencv

# remove cache files
RUN apt-get autoremove -y && apt-get clean && \
  rm -rf /usr/local/src/*

# copy requirements.txt file to docker-image
COPY requirements.txt /tmp/

# update pip
RUN python3 -m pip install --upgrade pip

# install python module
RUN pip install --no-cache-dir -U pip setuptools wheel \
    && pip install --no-cache-dir -r /tmp/requirements.txt

# pythorch is installed manually. Not with requirements.txt
RUN pip3 install torch==1.10.0+cu113 torchvision==0.11.1+cu113 \
    torchaudio===0.10.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html

# copy alias
COPY ./.alias /root
RUN cat /root/.alias >> /root/.bashrc
