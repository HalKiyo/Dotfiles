FROM ubuntu:latest

# timezone
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install linux env
RUN apt-get update && \
    apt update && \
    apt install -y \
    python3 python3-pip python3-dev python3-tk python3-opencv \
    wget \
    git \
    curl \
    make \
    sudo \
    vim \
    powerline \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# copy dotfiles 
COPY ./alias /root/.bashrc
COPY ./vimrc-script /root/.vimrc
COPY ./colors /root/.dircolors
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

# minor adjustment
ENV LANG="en_US.utf8"

# python module installation
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir --upgrade setuptools 
RUN pip install --no-cache-dir -U pip setuptools wheel \
    && pip install --no-cache-dir -r /tmp/requirements.txt

