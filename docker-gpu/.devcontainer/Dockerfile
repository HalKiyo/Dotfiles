FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=linux

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
    python3-opencv \
# for cartopy dependency but shapely version must be downgraded to 1.7.1
    libgeos-dev

# remove cache files
RUN apt-get autoremove -y && apt-get clean && \
  rm -rf /usr/local/src/*

# copy dotfiles
COPY ./alias /root/.bashrc
COPY ./vimrc-script /root/.vimrc
RUN mkdir /root/.vim
COPY ./cocsettings.json /root/.vim/coc-settings.json

# install nvm/Node.js
RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 16.13.0
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# install plug.vim
WORKDIR "/root/.vim/autoload"
RUN curl -fLO https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install coc.nvim extensions
RUN mkdir -p "/root/.config/coc/extensions"
WORKDIR "/root/.config/coc/extensions"
RUN if [ ! -f package.json ] ; then echo '{"dependencies": {}}' > package.json ; fi && \
    npm install \
    coc-json \
    coc-python \
    --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

# install python modules
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -U pip setuptools wheel \
    && pip install --no-cache-dir -r /tmp/requirements.txt

# pythorch is installed manually. Not with requirements.txt
RUN pip3 install torch==1.10.0+cu113 torchvision==0.11.1+cu113 \
    torchaudio===0.10.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html

# upgrading numpy from 1.17.4 to 1.23.1
RUN pip install --upgrade numpy
# downgrading shapely from 1.8.5.post to 1.7.1
RUN yes | pip uninstall shapely
RUN pip install shapely==1.7.1
