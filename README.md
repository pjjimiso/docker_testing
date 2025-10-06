## Images

### Pull the getting-started image
```
docker pull docker/getting-started
```

### List installed images
```
docker images
```

### Run container
```
docker run -d -p hostport:containerport namespace/name:tag
```
- `-d`: Run in detached mode (don't block terminal)
- `-p`: Publish (forward) container's port to the host
- `hostport`: Port on local machine
- `containerport`: Port inside container
- `namespace/name`: Image name (usually username/repo)
- `tag`: Image version (usually latest)

### Run getting-started container
```
docker run -d -p 8965:80 docker/getting-started:latest
```

### List running containers
```
docker ps
```

Now you can view the Getting started Web Page at `http://localhost:8965` which is being forwarded to port 80 in the container. 

### Stop/Kill running container
```
docker stop <container_id>
docker kill <container_id>
```

### Remove container
```
docker rm <container_id>
```

### Stop ALL running containers
```
docker stop $(docker ps -q)
```

## Volumes
- Create volume: `docker volume create ghost-vol`
- List volumes: `docker volume ls`
- Inspect volume: `docker inspect ghost-vol`


## Exec

### Execute a command in the container 
```
docker exec <container_id> ls 
```

### Get an interactive shell in the container
- `-i`: make exec interactive
- `-t`: return tty (keyboard)
```
docker exec -it <container_id> bash
```

## Networks

### Create a network
```
docker network create caddytest
```

