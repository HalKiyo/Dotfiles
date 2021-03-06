#!/bin/sh

pyrun=-py38
condarun=-conda
gpurun=-gpu
jupyterrun=-jupyter
down=-down
containeridpy38=`docker ps -a | grep py38 | awk '{print $2}'`
containeridconda=`docker ps -a | grep conda | awk '{print $2}'`
containeridgpu=`docker ps -a | grep gpu | awk '{print $2}'`
containeridjupyter=`docker ps -a | grep jupyter | awk '{print $2}'`
py38=py38
conda=conda
gpu=gpu
jupyter=jupyter
#set -x
if [ $1 = $pyrun ]; then
    cd ~/docker-python/.devcontainer
    if [ "$containeridpy38" != $py38 ]; then
        echo "py38 built"
        docker compose up -d --remove-orphans
    else
        echo "py38 already exit"
    fi
    echo "py38 activated"
    docker compose exec py38 bash
elif [ $1 = $condarun ]; then
    cd ~/docker-conda/.devcontainer
    if [ "$containeridconda" != $conda ]; then
        echo "conda built"
        docker compose up -d --remove-orphans
    else
        echo "conda already exit"
    fi
    echo "conda activated"
    docker compose exec conda bash
elif [ $1 = $gpurun ]; then
    cd ~/docker-gpu/.devcontainer
    if [ "$containeridgpu" != $gpu ]; then
        echo "gpu built"
        docker compose up -d --remove-orphans
    else
        echo "gpu already exit"
    fi
    echo "gpu activated"
    docker compose exec gpu bash
elif [ $1 = $jupyterrun ]; then
    cd ~/docker-jupyter/.devcontainer
    if [ "$containeridjupyter" != $jupyter ]; then
        echo "jupyter built"
        docker compose up -d --remove-orphans
    else
        echo "jupyter already exit"
    fi
    echo "jupyter activated"
    docker compose exec jupyter bash
elif [ $1 = $down ]; then
    if [ "$containeridpy38" = $py38 ]; then
        cd ~/docker-python/.devcontainer
        echo "py38 deactivated"
        docker compose down
    elif [ "$containeridconda" = $conda ]; then
        cd ~/docker-conda/.devcontainer
        echo "conda deactivated"
        docker compose down
    elif [ "$containeridgpu" = $gpu ]; then
        cd ~/docker-gpu/.devcontainer
        echo "gpu deactivated"
        docker compose down
    elif [ "$containeridgpu" = $jupyter ]; then
        cd ~/docker-jupyter/.devcontainer
        echo "jupyter deactivated"
        docker compose down
    fi
else
    echo "ERROR"
    echo "-py38"
    echo "-conda"
    echo "-gpu"
    echo "-jpyter"
    echo "-down"
    echo "available_option"
fi
