ARG BASE_IMAGE=ubuntu:latest
FROM ${BASE_IMAGE}
ENV DEBIAN_FRONTEND=noninteractive

# system update & package install
RUN apt-get clean && \
    apt-get -y update && \
    apt-get install -y --no-install-recommends \
    unzip bzip2 \
    openssl libssl-dev \
    curl wget \
    ca-certificates \
    locales \
    bash \
    sudo \
    git \
    vim \
    powerline \
    python3-tk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# ローカルuser作成
ARG USER_NAME=user
ARG USER_UID=1000
ARG PASSWD=password
RUN useradd -m -s /bin/bash -u ${USER_UID} ${USER_NAME} && \
    gpasswd -a ${USER_NAME} sudo && \
    echo "${USER_NAME}:${PASSWD}" | chpasswd && \
    echo "${USER_NAME} ALL=(ALL) ALL" >> /etc/sudoers && \
    chmod g+w /etc/passwd


# conda用準備
ENV CONDA_DIR=/opt/conda \
    CONDA_TMP_DIR=/tmp/conda \
    HOME=/home/$USER_NAME \
    SHELL=/bin/bash
RUN mkdir -p $CONDA_DIR && \
    mkdir -p $CONDA_TMP_DIR && \
    chown $USER_NAME:$USER_UID $CONDA_DIR && \
    chown $USER_NAME:$USER_UID $CONDA_TMP_DIR


# yamlファイルの取り込み
ARG CONDA_YAML="./environment.yml"
COPY $CONDA_YAML /tmp/conda_packages.yml

USER ${USER_NAME}


# miniconda
ARG MINICONDA_VERSION=py39_4.10.3-Linux-x86_64
ARG MINICONDA_MD5=8c69f65a4ae27fb41df0fe552b4a8a3b
ENV PATH=${CONDA_DIR}/bin:$PATH

RUN cd /tmp && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}.sh && \
    echo "${MINICONDA_MD5} *Miniconda3-${MINICONDA_VERSION}.sh" | md5sum -c - && \
    /bin/bash Miniconda3-${MINICONDA_VERSION}.sh -f -b -p $CONDA_TMP_DIR && \
    rm Miniconda3-${MINICONDA_VERSION}.sh && \
    $CONDA_TMP_DIR/bin/conda env create -f /tmp/conda_packages.yml -p $CONDA_DIR && \
    rm -rf $HOME/.cache/* && \
    rm -rf $CONDA_TMP_DIR/*

# alias copy
COPY ./.alias /root
RUN cat /root/.alias >> /root/.bashrc
