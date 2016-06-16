## Docker images to build b2g OS

Build a docker image with ubuntu 14.04 and then we can build b2g OS in the container.

##### Build docker image

Build a docker image and name it as 'build-image'.
```sh
docker build -t build-image .
```

##### List docker imagea

```sh
docker images
```

##### Start docker container

Simply start a container from docker image with name 'build-image', and name the container as 'build-b2g'. The name of the container need to be unique.
```sh
docker run -it --name build-b2g build-image /bin/bash
```

Now a ubuntu 14.04 container is running and it is totally isolated with host system.
So in order to clone git repos with ssh protocol, ssh key need to be set properly in container.
We can also add a new user in container to build projects (strongly recommended).

Mount a local directory in container at start.
```sh
docker run -v /path-in-local:/path-in-container -it --name build-b2g build-image /bin/bash
```
Note: When a local directory is mounted in container, need to modify the uid,gid of user in container to the same as user in host who owns the directory. Otherwise there will be permissioin problem. 'uid and gid' can be modified in /etc/passwd and /etc/groups respectively.

##### Exit from a container

```sh
exit
```
Note: When we exit the container, it will be stopped. Next time we don't need to start a new container, and instead we can start and attach the stopped container.

##### List stopped containers
There is an id and name for each container, and we can access the container with its id or name.
```sh
docker ps -a
```

##### Start a stopped container

```sh
docker start build-b2g
```

##### Attach a running container

```sh
docker attach build-b2g
```
