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

## Create a simple load balancer using Caddy 

1. Pull the caddy docker image: `docker pull caddy`
2. Create a new network: `docker network create caddytest`
3. Run two containers serving index1.html and index2.html
```
docker run -d -name caddy1 --network caddytest -v $PWD/index1.html:/usr/share/caddy/index.html caddy
docker run -d -name caddy2 --network caddytest -v $PWD/index2.html:/usr/share/caddy/index.html caddy
```
4. Start the round robin load balancer using Caddyfile 
```
docker run -d --network caddytest -p 8880:80 -v $PWD/Caddyfile:/etc/caddy/Caddyfile caddy
```
5. Open `http://localhost:8880/` in your browser and refresh the page. It should swap back and forth between caddy1 and caddy2 containers


## Dockerfiles

- Build an image from Dockerfile in CWD: `docker build . -t helloworld:latest`

## Dockerize a simple Go server (main.go, Dockerfile)

1. Set PORT env: `export PORT=8999`
2. Build the Go server: `go build`
3. Run the server: `./docker_testing`
4. Test endpoints: `curl localhost:8999`
5. Build the Dockerfile: `docker build . -t docker_testing:latest`
    - **NOTE**: we changed the port to 8991 in Dockerfile
6. Run the container: `docker run -p 8991:8991 docker_testing`


## Dockerize our Bookbot Python script (main.py, Dockerfile.py)

1. Build the Dockerfile: `docker build -t bookbot -f Dockerfile.py .`
2. Run the container: `docker run bookbot`

Notice that building the Go server is more complex, but the Dockerfile is simple because it just needs to provide the compiled binary. With Python, our Dockerfile is more complicated because we have to install the specific Python interpreter and its dependencies in every container. 
