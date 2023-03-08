#!/bin/sh

pyrun=-py38
condarun=-conda
gpurun=-gpu
jupyterrun=-jupyter
down=-down
containeridpy38=`docker ps -a | grep py38 | awk '{print $(NF-0)}'`
containeridconda=`docker ps -a | grep conda | awk '{print $(NF-0)}'`
containeridgpu=`docker ps -a | grep gpu | awk '{print $(NF-0)}'`
containeridjupyter=`docker ps -a | grep jupyter | awk '{print $(NF-0)}'`
py38=py38
conda=conda
gpu=gpu
jupyter=jupyter
#set -x
if [ $1 = $pyrun ]; then
    cd ~/docker-python/.devcontainer
    if [ "$containeridpy38" != $py38 ]; then
        docker compose up -d
    else
        echo "py38 already running"
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
    echo "-down"
fi
