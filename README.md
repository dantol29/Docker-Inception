# Docker-Inception


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

## Dockerfile

- `docker build -t <image_name> .`

- A text file that contains a set of commands used to build a Docker image.

	### 1. Base Image:

	It could be a minimal Linux distribution like Alpine or a more feature-rich distribution like Ubuntu.

	Example: `FROM ubuntu:20.04`

	### 2. Environment Setup:

	Instructions for installing packages, dependencies, or libraries required by your application.
	
	Example: `RUN apt-get update && apt-get install -y python3`
	
	## 3. Working Directory:
	
	Define the working directory inside the container.
	
	Example: `WORKDIR /app`
	
	## 4. Copy Application Files:
	
	Copy your application code or files into the container.
	
	Example: `COPY . .` 
	(_means "copy everything from the current directory on the host machine into the current directory inside the Docker container being built."_)

	## 5. Expose Ports:

	Specify which ports your container will listen on at runtime.

	Example: `EXPOSE 80`

	## 6. Run Commands:

	Execute commands inside the container during the build process.
	
	Example: `RUN pip install`

	## 7. Set Environment Variables:

	Define environment variables that will be available to the application.
	
	Example: `ENV NODE_ENV=production`

	## 8. Container Execution Command:

	Specify the command to run when the container starts.

	Example: `ENTRYPOINT ["npm", "run"]`

