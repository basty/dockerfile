# dockerfile

A dockerfile useful for machine learning. It is based on TensorFlow 2 - GPU and includes Keras, Torch, Python 3.6 and Jupyter 

# Installation
Git clone this to your local computer to build your own image.

you can run it with sudo docker create --runtime=nvidia -p 8888:8888 -p 6006:6006 -v $(pwd):/tf/shared --name <container_name> <image_name>

there is a shared volume (/tf/share) you can change.

# Instructions
Either build your own image or use it from dockerhub: docker pull masterbasty/learning