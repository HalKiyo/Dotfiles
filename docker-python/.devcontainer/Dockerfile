FROM ubuntu:20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt clean && \
    apt update && \
    apt install -y \
    python3.8 python3-pip python3.8-dev python3-tk python3-opencv \
    wget \
    bzip2 \
    git \
    curl \
    unzip \
    make \
    sudo \
    vim \
    sudo \
    powerline \
    libgeos-dev \
    && apt clean \
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

### downgrade Shapely
RUN yes | pip uninstall shapely
RUN pip install shapely==1.7.1
