# Docker Installation

https://docs.docker.com/desktop/
https://docs.docker.com/desktop/install/windows-install/
https://docs.docker.com/desktop/install/mac-install/

https://docs.docker.com/desktop/install/linux-install/

# Commands on Hands On

```
docker --version
docker run hello-world
docker pull busybox
docker images
docker run busybox
docker run busybox echo "hello from busybox kubernetes"
docker ps
docker ps -a
docker run -it busybox sh
docker rm <container_id>
```

# 2. Hands On


```
docker run -d -P --name catgif nachikethmurthy/catgif:v1
docker ps
docker port catgif
docker stop catgif
docker run -p 8888:5000 nachikethmurthy/catgif:v1
docker build -t nachikethmurthy/catgif .
docker run -p 8000:5000 nachikethmurthy/catgif
docker login
docker push nachikethmurthy/catgif
```

#
localhost:<port-number>
127.0.0.1:<port-number>