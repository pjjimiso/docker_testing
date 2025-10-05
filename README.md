### Pull the getting-started image
```
docker pull docker/getting-started
```

### List installed images
```
docker images
```

### Run the getting-started container
- `-d`: Run in detached mode (don't block terminal)
- `-p`: Publish (forward) container's port to the host
- `hostport`: Port on local machine
- `containerport`: Port inside container
- `namespace/name`: Image name (usually username/repo)
- `tag`: Image version (usually latest)
```
docker run -d -p 8965:80 docker/getting-started:latest
```

### List running containers
```
docker ps
```

Now you can view the Getting started Web Page at `http://localhost:8965` which is being forwarded to port 80 in the container. 
