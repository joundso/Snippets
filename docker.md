# Docker Snippets

- [Docker Snippets](#docker-snippets)
  - [Changing rights inside a container](#changing-rights-inside-a-container)
  - [Build a dockerfile](#build-a-dockerfile)
  - [Push an image to a hub/harbor](#push-an-image-to-a-hubharbor)
  - [Docker run](#docker-run)
  - [Docker-compose options](#docker-compose-options)
    - [Run container](#run-container)
    - [Stop container (but keep changes within container)](#stop-container-but-keep-changes-within-container)
  - [Reset container (and reset changes within the container)](#reset-container-and-reset-changes-within-the-container)
  - [Delete unused images](#delete-unused-images)
  - [Delete exited containers](#delete-exited-containers)
  - [Get infos about container status](#get-infos-about-container-status)
  - [Get info about docker](#get-info-about-docker)
  - [Clean the cache](#clean-the-cache)
  - [Remove docker container](#remove-docker-container)
  - [Remove docker images](#remove-docker-images)
  - [Remove stopped containers](#remove-stopped-containers)
  - [Tag an image during the build process](#tag-an-image-during-the-build-process)
  - [Tag an already built image](#tag-an-already-built-image)
  - [Change docker path under WSL2 (PowerShell)](#change-docker-path-under-wsl2-powershell)
  - [Access an docker image with a bash inside](#access-an-docker-image-with-a-bash-inside)
  - [Send / Transfer an image without a docker registry / harbor](#send--transfer-an-image-without-a-docker-registry--harbor)

## Changing rights inside a container

1. Access the container by using

    ```bash
    docker exec -it containername /bin/bash

    ## Or if this doesn't work (because you use the shell in windows), try:
    docker exec -it containername //bin//bash
    ```

2. `cd` to the folder you want to change the rights of.
3. Run

    ```bash
    sudo chown -R user:user .
    ```

    to change the rigths of the current folder for the user `user` to make him able to read (which states the capital `R`).

## Build a dockerfile

```bash
## Build with a custom tag:
docker build -t tagname .

## Build with custom dockerfile and custom tag:
docker build -f Dockerfile -t containername:tag .
```

## Push an image to a hub/harbor

```bash
## Login to the harbor:
docker login "https://docker.hub.org/url"

## Push an existing image (the name of the image is its URL):
docker push https://docker.hub.org/url/IMAGE_NAME:VERSION_TAG
```

## Docker run

```bash
docker run -it containername bash
```

## Docker-compose options

### Run container

The suffix `-d` releases the console after starting the container. So the console won't be flooded/blocked.

```bash
## Start a local docker-compose.yml file in the current directory:
docker-compose up -d

## Run a specific docker-compose file:
docker-compose -f custom.docker-compose.yml up -d

## Run a specific docker-compose file with a specific .env file:
docker-compose -f custom.docker-compose.yml --env-file /path/to/.env up -d

## Re-build Dockerfile specified in your docker-compose file (use the `--build` flag after the `up` command):
docker-compose --env-file ../custom.env up --build -d
```

### Stop container (but keep changes within container)

```bash
## If there is a docker-compose.yml file in the current directory:
docker-compose stop

## OR: If you want to stop another container, obtain its CONTAINERNAME by running:
docker ps -a
## and stop this container:
docker stop CONTAINERNAME
```

## Reset container (and reset changes within the container)

```bash
docker-compose down
```

## Delete unused images

```bash
docker images
docker rmi IMAGE_ID
```

## Delete exited containers

```bash
docker rm $(docker ps -qa --no-trunc --filter "status=exited")
```

## Get infos about container status

```bash
docker ps -a
```

## Get info about docker

```bash
docker info
```

## Clean the cache

The `docker system prune` command will remove all stopped containers, all dangling images, and all unused networks:

```bash
docker system prune
```

## Remove docker container

```bash
## List all containers:
docker ps -a
## or: 
# docker container ls -a

## Remove the container(s) by id:
docker container rm ID1 ID2
```

## Remove docker images

```bash
docker image ls
docker image rmi ID1 ID2
```

## Remove stopped containers

```bash
docker rm `docker ps --no-trunc -aq`
```

## Tag an image during the build process

```bash
docker build -t "imageNAME:imageTAG" .
```

Don't forget the last `.`! =)

## Tag an already built image

```bash
docker tag <old-image-name>:<old-image-tag> <new-image-name>:<new-image-tag>
```

## Change docker path under WSL2 (PowerShell)

The new path in this example is: `K:\Docker`

```bash
wsl --export docker-desktop-data "K:\Docker\docker-desktop-data.tar"
wsl --unregister docker-desktop-data
wsl --import docker-desktop-data "K:\Docker" "K:\Docker\docker-desktop-data.tar" --version 2
```

## Access an docker image with a bash inside

```bash
docker run -it IMAGENAME /bin/bash

## Try //bin//bash if the upper command doesn't work.
```

## Send / Transfer an image without a docker registry / harbor

Reffering to <https://stackoverflow.com/a/23938978> and <https://stackoverflow.com/a/26226261>

```bash
## Don't forget to mention the image tag, otherwise the image won't be tagged after unpacking it:
# docker save -o <path for generated tar file> <image name>
docker save -o /tmp/myfile.tar centos:16

## Then on the target system, load the file:
docker load -i <path to image tar file>
```

Transferring a Docker image via SSH, bzipping the content on the fly:

```bash
docker save <image> | bzip2 | ssh user@host docker load

## Or with visualization of the transfer process:
docker save <image> | bzip2 | pv | ssh user@host docker load
```
