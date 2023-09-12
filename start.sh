#!/bin/sh

pyrun=-py38
condarun=-conda
gpurun=-gpu
jupyterrun=-jupyter
h08run=-h08
down=-down
containeridpy38=`docker ps -a | grep py38 | awk '{print $(NF-0)}'`
containeridconda=`docker ps -a | grep conda | awk '{print $(NF-0)}'`
containeridgpu=`docker ps -a | grep gpu | awk '{print $(NF-0)}'`
containeridjupyter=`docker ps -a | grep jupyter | awk '{print $(NF-0)}'`
containeridh08=`docker ps -a | grep h08 | awk '{print $(NF-0)}'`
py38=py38
conda=conda
gpu=gpu
jupyter=jupyter
h08=h08
#set -x
if [ $1 = $pyrun ]; then
    cd ~/docker-python/.devcontainer
    if [ "$containeridpy38" != $py38 ]; then
        docker compose up -d
    else
        echo "py38 already running"
    fi
    echo "py38 activated"
    docker compose exec py38 bash
elif [ $1 = $condarun ]; then
    cd ~/docker-conda/.devcontainer
    if [ "$containeridconda" != $conda ]; then
        docker compose up -d
    else
        echo "conda already running"
    fi
    echo "conda activated"
    docker compose exec conda bash
elif [ $1 = $gpurun ]; then
    cd ~/docker-gpu/.devcontainer
    if [ "$containeridgpu" != $gpu ]; then
        docker compose up -d
    else
        echo "gpu already running"
    fi
    echo "gpu activated"
    docker compose exec gpu bash
elif [ $1 = $jupyterrun ]; then
    cd ~/docker-jupyter/.devcontainer
    if [ "$containeridjupyter" != $jupyter ]; then
        docker compose up -d
    else
        echo "jupyter already running"
    fi
    echo "jupyter activated"
    docker compose exec jupyter bash
elif [ $1 = $h08run ]; then
    cd /mnt/h/docker-h08/.devcontainer
    if [ "$containeridh08" != $h08 ]; then
        docker compose up -d
    else
        echo "h08 already running"
    fi
    echo "h08 activated"
    docker compose exec h08 bash
elif [ $1 = $down ]; then
    if [ "$containeridpy38" = $py38 ]; then
        cd ~/docker-python/.devcontainer
        docker compose down --remove-orphans
    elif [ "$containeridconda" = $conda ]; then
        cd ~/docker-conda/.devcontainer
        docker compose down --remove-orphans
    elif [ "$containeridgpu" = $gpu ]; then
        cd ~/docker-gpu/.devcontainer
        docker compose down --remove-orphans
    elif [ "$containeridgpu" = $jupyter ]; then
        cd ~/docker-jupyter/.devcontainer
        docker compose down --remove-orphans
    fi
else
    echo "ERROR"
    echo "available_options"
    echo "-py38"
    echo "-conda"
    echo "-gpu"
    echo "-jupyter"
    echo "-h08"
    echo "-down"
fi
