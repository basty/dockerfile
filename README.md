# dockerfile
from tensorflow/tensorflow:2.0.0b1-gpu-py3-jupyter

sudo docker create --runtime=nvidia -p 8888:8888 -p 6006:6006 -v $(pwd):/tf/shared --name <container_name> <image_name>