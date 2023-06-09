# Docker Environment for AWS CLI, Python3, Node.js, and Python Libraries

This Docker environment includes AWS CLI, Python3, Node.js, and several Python libraries installed on a lightweight Alpine Linux base. It also includes Japanese locale settings.

## Prerequisites

- Docker
- Docker Compose

### Starting the Container

Navigate to the directory where the Dockerfile and docker-compose.yml are saved.

```bash
cd /path/to/your/directory
```

Use Docker Compose to build and start the container.

```
docker-compose up --build -d
```

The Docker container will start with the specified settings.

## Stopping the Container
You can stop the container using the following command:

```
docker-compose down
```

## Entering the Container
You can enter the running container using the following command:

```
docker exec -it aws_python3 /bin/bash
```

This will start a bash shell in the container.

## Checking Installed Applications
Once inside the container, you can check the installed applications using their respective commands, for example:

```
aws --version
python3 --version
node --version
pip list

```

The pip list command will show the installed Python libraries.


## Adding More Applications or Libraries
If you need to add more applications or Python libraries, you can do so by modifying the Dockerfile. For example, to add the curl utility, you can add the following line to the Dockerfile:

```
RUN apk add --no-cache curl
```

Or to add a Python library, you can add a line like this:

```
RUN pip install library-name
```

Then, you can rebuild and restart the container using docker-compose up --build -d.


## Volumes
The following directories on the host are mounted to the Docker container:

```
./user/opt (host) is mounted to /opt (container)
./user/aws (host) is mounted to /home/myuser/.aws (container)
```

You can access these directories from within the Docker container.


## Troubleshooting When Unable to Access the Container

If you are unable to access the container, you can try the following steps:

1. Run the `docker ps -a` command to display a list of all containers. The `-a` option shows both running and stopped containers.

2. Identify the name or ID of the specific container from the list.

3. Use the `docker start <container-name-or-id>` command to start a stopped container.

4. Once the container is running, use the `docker exec -it <container-name-or-id> bash` command to access the container.

Please follow the above steps accordingly. If the container is stopped, you need to start it first.
