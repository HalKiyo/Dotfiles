#!/bin/sh

notebookrun=-notebook
labrun=-lab
#set -x
if [ $1 = $notebookrun ]; then
    jupyter notebook --allow-root --ip=0.0.0.0 --port=8888 --no-browser
elif [ $1 = $labrun ]; then
    jupyter lab --allow-root --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token=''
else
    echo "ERROR"
    echo "available_option"
    echo "-notebook"
    echo "-lab"
fi
