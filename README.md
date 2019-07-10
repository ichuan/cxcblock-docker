# cxcblock-docker
Dockerfile for cxcblock

- RPC Port: `7318`
- RPC User/Password: `user/password`


# Building

```bash
docker build -t cxcblock .
```

# Running

```bash
# block and wallet dir
mkdir data
docker run --rm -itd --name icxc -p 7318:7318 -v `pwd`/data:/opt/coin cxcblock
```

# Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/cxcblock/>:

```bash
docker run --rm -itd --name icxc -p 7318:7318 -v `pwd`/data:/opt/coin mixhq/cxcblock
```
