#!/bin/sh

pyrun=-py38
condarun=-conda
gpurun=-gpu
down=-down
containeridpy38=`docker ps -a | grep py38 | awk '{print $2}'`
containeridconda=`docker ps -a | grep conda | awk '{print $2}'`
py38=py38
conda=conda
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
    echo "gpu activated"
    docker run --rm -it --shm-size=48GB \
        --gpus all --mount type=bind,source=/,target=/docker \
        -t gpu:latest
elif [ $1 = $down ]; then
    if [ "$containeridpy38" = $py38 ]; then
        cd ~/docker-python/.devcontainer
        echo "py38 deactivated"
        docker compose down
    elif [ "$containeridconda" = $conda ]; then
        cd ~/docker-conda/.devcontainer
        echo "conda deactivated"
        docker compose down
    fi
else 
    echo "ERROR"
    echo "-py38"
    echo "-conda"
    echo "-gpu"
    echo "-down"
    echo "available_option"
fi
