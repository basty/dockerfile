# dockerfile
sudo docker create --runtime=nvidia -p 8888:8888 -p 6006:6006 -v $(pwd):/tf/shared --name <container_name> <image_name>