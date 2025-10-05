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

## Volumes
- Create volume: `docker volume create ghost-vol`
- List volumes: `docker volume ls`
- Inspect volume: `docker inspect ghost-vol`

