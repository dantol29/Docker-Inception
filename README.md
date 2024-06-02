# Docker-Inception

## Useful commands

- `docker build -t image_name:tag .` - run dockerfile
- `docker exec -it container_id_or_name /bin/bash` - enter container
- `docker images` - list all docker images
- `docker ps -a` - list both stopped and running containers
- `docker rmi image_id_or_name` - delete an image
- `docker rm container_id_or_name` - delete a container
- `docker stop container_id_or_name` - stop a container
- `docker container prune` - delete all stopped containers



## Docker Images

- Docker images are like blueprints or templates. They contain the instructions for creating a Docker container.
These instructions include the operating system, dependencies, libraries, and etc.

- Docker images are created using a Dockerfile, which specifies the configuration and setup of the environment.

## Docker Containers

- `docker run <image_name>`

- Docker containers are the runnable instances of Docker images.

- When you run a Docker image, it creates a container. Containers are lightweight, isolated environments that encapsulate the application and its dependencies.

- Containers have their own filesystem, networking, and process space, but they share the kernel of the host operating system.

- Containers can be started, stopped, moved, and deleted independently of each other.

<details>
<summary><h2>Dockerfile</h2></summary>

- `docker build -t <image_name> .`

- A text file that contains a set of commands used to build a Docker image.

	### 1. Base Image: `FROM`

		It could be a minimal Linux distribution like Alpine or a more feature-rich distribution like Ubuntu.

		Example: `FROM ubuntu:20.04`

	### 2. Environment Setup: `RUN`

		Instructions for installing packages, dependencies, or libraries required by your application.
	
		Example: `RUN apt-get update && apt-get install -y python3`
	
	### 3. Working Directory: `WORKDIR`
	
		Define the working directory inside the container.
	
		Example: `WORKDIR /app`
	
	### 4. Copy Application Files: `COPY`
	
		Copy your application code or files into the container.
	
		Example: `COPY . .` 
		(_means "copy everything from the current directory
  		on the host machine into the current directory inside the Docker container being built."_)

	### 5. Expose Ports: `EXPOSE`

		Specify which ports your container will listen on at runtime.

		Example: `EXPOSE 80`

	### 6. Run Commands: `RUN`

		Execute commands inside the container during the build process.
	
		Example: `RUN pip install`

	### 7. Set Environment Variables: `ENV`

		Define environment variables that will be available to the application.
	
		Example: `ENV NODE_ENV=production`

	### 8. Container Execution Command: `ENTRYPOINT`

		Specify the command to run when the container starts.

		Example: `ENTRYPOINT ["npm", "run"]`
  
</details>
<details>
	
<summary><h2>Docker Compose</h2></summary> 

- Used for running `multi-container Docker applications`. It allows you to use a YAML file (usually named `docker-compose.yml`) to configure the services, networks, and volumes for your application, making it easier to manage and deploy complex applications consisting of multiple interconnected containers.

- Automatically creates a `default network` for your application, allowing services to communicate with each other using their service names as hostnames.

- Allows you to define `volumes` in the docker-compose.yml file, which are managed by Docker and can be reused across different containers. Volumes allow you to store and share data between containers.

There has to be at least one `service` and _optionally_ `volume` and `network`
```
version: "3.7"
services:
  ...
volumes:
  ...
networks:
  ...
```
<details>
<summary><h3>Services</h3></summary>

```
services:
  frontend:
    image: my-vue-app
    ...
  backend:
    image: my-springboot-app
    ...
  db:
    image: postgres
```
#### 1. Building an image
```
build: /path/to/dockerfile/
```
#### 2. Networking
A service can communicate with another service on the same network through the expose keyword:
```
expose:
      - "80"
```
To reach a container from the host, the ports must be exposed declaratively through the ports keyword, which also allows us to choose if we’re exposing the port differently in the host
```
ports:
      - "8080:3000"
```
#### 3. Dependency chain
Create a dependency chain between the services so that some services get loaded before (and unloaded after) other ones.
```
depends_on:
      - zookeeper
```

#### 4. Enviromental variables
We can define static environment variables, as well as dynamic variables, with the ${} notation

There are different methods to provide those values to Compose. One method  is setting them in a .env file in the same directory, structured like key=value:
```
environment:
      DB: mydb
      USER: "${USER}"
```
</details>

<details>
	
<summary><h3>Volumes</h3></summary>

- Volumes are physical areas of disk space shared between containers. In other words, a volume is a shared directory in the host, visible from some or all containers.

Here, both containers will have `read/write access` to the global-volume shared folder. 

We can make a volume in `read-only mode` by appending :ro to the rule, like for the /home folder. 
```
services:
  example-service:
    image: alpine:latest
    volumes: 
      - global-volume:/path-inside-the-service
      - /tmp:/read-write
      - /home:/only-read:ro
  example-service-2:
    image: alpine:latest
    volumes:
      - global-volume:/where-to-store-volume
volumes:
 global-volume: 
```
</details>

### Network

- Network define the communication rules between containers, and between a container and the host. Common network zones will make the containers’ services discoverable by each other, while private zones will segregate them in virtual sandboxes.

</details>
