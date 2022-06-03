FROM nvidia/cuda:11.4.0-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive 
ENV TERM=linux
ENV NOTO_DIR /usr/share/fonts/opentype/notosans

## aptに時間がかなりかかるので、パッケージを絞っています。
RUN apt update \
    && apt install -y \
    wget \
    bzip2 \
    git \
    curl \
    unzip \
    vim \
    file \
    xz-utils \
    sudo \
    python3-tk \
    python3-pip \
    python3-opencv

RUN mkdir -p ${NOTO_DIR} &&\
  wget -q https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip -O noto.zip &&\
  unzip ./noto.zip -d ${NOTO_DIR}/ &&\
  chmod a+r ${NOTO_DIR}/NotoSans* &&\
  rm ./noto.zip

# remove cache files
RUN apt-get autoremove -y && apt-get clean && \
  rm -rf /usr/local/src/*

COPY requirements.txt /tmp/

RUN pip install --no-cache-dir -U pip setuptools wheel \
    && pip install --no-cache-dir -r /tmp/requirements.txt

# pythorch is installed manually. Not with requirements.txt
RUN pip3 install torch==1.10.0+cu113 torchvision==0.11.1+cu113 \
    torchaudio===0.10.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
