py38:
    python:3.8.0-slim-buster
    pip
    python==3.8.9
    modules:
        numpy
        matplotlib
        pandas
        chardet

conda:
    ubuntu:latest
    conda(conda-forge, anaconda)
    miniconda==py39_4.10.3-Linux-x86_64
    python==3.8.5
    modules:
        numpy
        pandas
        cartopy
        netCDF4
        scikit-learn
        seaborn
        matplotlib

gpu:
    ubuntu20.04
    pip
    python==3.8.10
    gpu(cuda:11.3.0-cudnn8-devel)
    torch==1.10.0+cu113
    torchvision==0.11.1+cu113
    modules:
        numpy==1.23.1
        scipy
        pandas
        keras
        tensorflow
        tensorboardX
        scikit-learn
        xgboost
        lightgbm

jupyter: 
    ubuntu20.04
    pip
    python==3.8.10
    gpu(cuda:11.3.0-cudnn8-devel)
    torch==1.10.0+cu113
    torchvision==0.11.1+cu113
    ports:
        - "127.0.0.1:8888:8888"
    modules:
        numpy=1.22.4
        notebook
        RISE=5.7.1
        jupyterlab
        jupyterlab_vim
        keras
        tensorflow
        cartopy

# how to use "docker commit" 
```shell
docker ps
docker images
```

- if you wanna replace[update] existing image
    -   ```shell
        docker commit --pause=false [conainer name] [image name:latest]
        ```

# if you wanna create new image
```shell
docker commit --pause=false [conainer name] [image name:0]
cd ~/[image name]/.devcontainer
vi docker-compose.yml
    edit "image: [image name:0]"
docker compose exec [image name:0] bash
docker stop [image name]
```

```shell
docker rm [new container]
docker rmi [new image name]
```

# fzf cheet sheet
- fzf: output result in terminal

- fzf-tmux: open script in a new tmux pane

- ctrl+t: copy&past on command line

- right alt+c: directory change

- ctrl+r: command history
