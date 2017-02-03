![zeppelin-logo](https://s29.postimg.org/9j5narjvr/zeppelin_logo_uni_500.png)

# Zeppelin

- ![Version](https://images.microbadger.com/badges/version/xemuliam/zeppelin:0.6.2.svg) ![Layers](https://images.microbadger.com/badges/image/xemuliam/zeppelin-base:0.6.2.svg) 0.6.2 = 0.6 = latest

[Docker](https://www.docker.com/what-docker) image for [Apache Zeppelin](http://zeppelin.apache.org)

- ![Docker builds](https://img.shields.io/docker/automated/xemuliam/zeppelin.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/xemuliam/zeppelin.svg) ![Docker Stars](https://img.shields.io/docker/stars/xemuliam/zeppelin.svg)
 
Created from Zepplin [base image](https://hub.docker.com/r/xemuliam/zeppelin-base) to minimize traffic and deployment time in case of changes should be applied on top of Zeppelin.
Added re-compiled JDBC library to avoid full scan of all database schemas on JDBC-query initialization.

## Why base image is required?

DockerHub does not cache image layers while compilation. Thus creation of base image (with pure Zeppelin) mitigates this issue and let us to experiment/play with Zeppelin settings w/o downloading full Zeppelin archive (more than 500MB) each time when we change smth. in configuration (or libs, add-ons, etc.) and recompile docker image. Only our changes will be pulled out from Docker Hub instead of full image.

```
 __________
< Zeppelin >
 ----------
    \
     \
      \
                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
        \    \        __/
          \____\______/
```
  

*__Please use corresponding branches from this repo to play with code.__*


# Overview

Dockerized single-host Zeppelin.

Deployment options out of the box:
- Standalone Zeppelin node


# Exposed ports

- 8080 - Zeppelin web application port
- 8443 - Zeppelin web application secure port


# Volumes

All below volumes can be mounted to docker host machine folders or shared folders to easy maintain data inside them. 

Zeppelin-specific:
- /opt/zeppelin/logs
- /opt/zeppelin/notebook


# Official Documentation and Guides

- [Overview](http://zeppelin.apache.org/docs/0.6.2/)
- [Quick Start](http://zeppelin.apache.org/docs/0.6.2/install/install.html)
- [Interpreters](http://zeppelin.apache.org/docs/0.6.2/manual/interpreters.html)
- [Wiki](https://cwiki.apache.org/confluence/display/ZEPPELIN/Zeppelin+Home)


# Usage

This image can either be used as a base image for building on top of NiFi or just to experiment with. I personally have not attempted to use this in a production use case.

Please use corresponding branches from this repo to play with code.


# Pre-Requisites
Ensure the following pre-requisites are met (due to some blocker bugs in earlier versions). As of today, the latest Docker Toolbox and Homebrew are fine.

- Docker 1.10+
- Docker Machine 0.6.0+
- Kitematic 0.12

(all downloadable as a single [Docker Toolbox](https://www.docker.com/products/docker-toolbox) package as well)


# How to use from Kitematic

1. Start Kitematic
2. Enter `xemuliam` in serach box
3. Choose `zeppelin` image
4. Click `Create` button

Kitematic will assign all ports and you'll be able to run NiFi web-interface directly from Kitematic.


# How to use from Docker CLI

1. Start Docker Quickstart Terminal
2. Run command  `docker run -d -p 8080:8080 -p 8443:8443 xemuliam/zeppelin`
3. Check Docker machine IP  `docker-machine ls`
4. Use IP from previous step in address bar of your favorite browser, e.g. ` http://192.168.99.100:8080/#/`

# Enjoy! :)
