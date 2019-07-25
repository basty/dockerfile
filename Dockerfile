FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
ARG python_version=3.6.6
ARG tensorflow_version=2.0.0-beta1

USER root

# Install system packages
RUN apt-get update && apt-get install -y python3-pip && pip3 install --upgrade pip
RUN apt-get update && apt-get install -y --no-install-recommends \
      bzip2 \
      g++ \
      git \
      graphviz \
      libgl1-mesa-glx \
      libhdf5-dev \
      openmpi-bin \
      python3 \
      wget && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --upgrade setuptools
RUN pip3 install wheel

RUN pip3 install \
      h5py \
      matplotlib \
      mkl \
      nose \
      notebook \
      Pillow \
      pandas \
      pydot \
      theano \ 
      pyyaml \
      scikit-learn \
      six \
      sklearn_pandas \
      tensorflow-gpu==${tensorflow_version} \
      keras \
      h5py \
      graphviz \
      pydot \
      jupyter

ENV NB_USER ml
ENV NB_UID 1000

RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    chown $NB_USER /srv -R
USER $NB_USER

WORKDIR /srv

EXPOSE 8888 6006

CMD jupyter notebook --port=8888 --ip=0.0.0.0
