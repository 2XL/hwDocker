#### Learning Docker 
Optimize the power of docker to run your applications quickly and easily


##### Install:

```{r, engine='shell', count_lines}
# install docker
sudo apt-get install -y docker.io
# upgrade to latest version
echo "docker source"
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
echo "docker release public key"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
echo "install docker..."
sudo apt-get install -y lxc-docker
# current release 1.12.1

```


#### Command Cheat Sheet:


```
docker pull [-a] [boxname] # for instance: busybox, download -a all versions
# box name or path location format
#  https:// - http:// - ftp:// - or local container absolute path

docker images [--no-trunc] # list installed & available containers., show full hash

docker run [--name] [--rm] [-t] [-i] [boxname] [bash command here] # --name manual config host id, --rm remove on terminate, -t tty terminal, -i interactive stdin open... 

service docker [status|start|stop] # docker deamon status

/var/log/upstart/docker.log # logs files

docker search [lookup keyword] # search of images

docker ps [-a] # list all the running containers and their properties, -a all even stopped instances

docker diff [instance-id or name] # inspect the fs for changes.

docker stop [instance-id or name] # terminate a running docker instance

docker start [instance-id or name] # resume an idle docker instance 

docker attach [instance-id or name] # gather instance tty

docker pause [instance-id or name] # freeze all the execution of all the processes within that container 

docker unpause [instance-id or name] # converse to pause. resume the exectution from the point where is was frozen.

docker rm [-f] [instance-id or name] 'sudo docker ps -aq --no-trunc' # remove all idle instances, -f remove also running instances

```

#### Task Lists


 - [ ] task 1: docker hello world
 - [ ] task 2: docker docker-compose.yml 
 - [ ] task x
 - [x] John Gay says infinity is a number :+1: .





#### getting started with docker


* Key concepts:

    * VMs vs Containers
        * VM represents harware-level virtualization (heavyweight), limited performance, fully isolated and hence more secure
        * Cont. represents operating system virtualization (lightweight), native performance, process-level isolation and hence less secure

    * Docker Engine: produce, monitor and manages multiple containers
    
    * Docker Image: unit of software entity that is embodied within an isolated module, which can be stacked with parent (root image, OS) to form a composite. 

    * Docker Layer: can be represented as r-only or rw images. however the top layer of a container is always the rw layer, which hosts a Docker container. 
    
    * Docker Container: rw layer == container layer, Docker pulls the required image and its parent image. trough all the parent images until it reaches the base image.
    
    * Docker Registry: is a place where the docker images can be stored in order to be publicly found, accessed...
    
    * Docker Repository: is a namespace that is used for storing Docker image.
    
    * Docker Hub Registry: docker pull subcommand is programmed to lookup by default images available in the public docker registry (index.docker.io)
    
* Acronims (order by name asc):

    * AIX: Advanced Interactive Executive
    * AUFS: Another Union File System
    * IANA: Internet Assigned Numbers Authority  # docker default 2375
    * FreeBSD: Free Berkley Software Distribution
    * LXC: Linux Containers
    * VEs: Virtual Environments
    * VPSs: Virtual Private Servers
    * WPARs: Workload Partitions
    * 