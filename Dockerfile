FROM tensorflow/tensorflow:2.0.0b1-gpu-py3-jupyter

USER root

RUN apt-get update && apt-get install -y python3-pip && pip3 install --upgrade pip

## Install system packages
RUN apt-get install -y wget git sudo

RUN pip3 install \
      keras \
      pillow \
      torch \
      torchvision \
      jupyterthemes

#USER $NB_USER

ENV NB_USER ml
ENV NB_UID 1000

RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER -p mlpwd && \
    chown $NB_USER /srv -R
USER $NB_USER

WORKDIR /srv

EXPOSE 8888 6006

RUN jt -t onedork -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T
RUN mkdir -p $HOME/.jupyter/
RUN mkdir -p /tf/shared/
RUN echo "c.NotebookApp.token=''" >> $HOME/.jupyter/jupyter_notebook_config.py

