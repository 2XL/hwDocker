
```


### Data volume

# VOLUME (-v) docker run subcommand
sudo docker run  --rm -it <instance-name> <cmd:mount>
sudo docker inspect <instance-id>
sudo docker run -v /MountPointDemo -it <image-name>:<image-version>
sudo docker rm -v <instance-name> # -v remove also the volumes, -f remove also running containers

### Sharing host data 

## Sample 1 
sudo docker run -v <countainer mount path>
sudo docker run -v <host path>/<container mount path>
sudo docker run -v <host path>/<container mount path>:<read/write mode>

# host path: absolute path in the docker host.
# container mount path: absolute path in the container fs
# read write mode: [ro|rw] 

sudo docker inspect --format={{.Volumes}} <instance-id>

## Sample 2: practicality of host data sharing

sudo docker run -d -p 80:80 -v /var/log/myhttpd:/var/log/apache2 apache2

### Sharing data between containers

## Sample 1: Data-only containers
sudo docker run --name datavol -v /DataMount busybox:latest /bin/true
#               name of instance, instance datavol, /bin/true == noop & exit 0

## Sample 2: Mounting data volume from other containers
sudo docker run --name log_vol apache2log

sudo docker run -it --volumes-from datavol ubuntu:latest /bin/bash
# datavol vols are made available inner this instance

sudo docker run --rm --volumes-from log_vol busybox:latest ls -l /var/log/apache2


sudo docker run --rm --volumes-from log_vol ubuntu:14.04 tail /var/log/apache2/error.log





```


### The avoidance of common pitfalls

:: common issues associated with data sharing and the ways and means to overcome them.

1. Directory leaks
    1. un-deleted directories: intentionally or un-intentionally choose to not remove generated vols.
    2. third party images: we might not be aware of their dir creations and forget/miss "rm -v"

::: issues 
once the associated container is removed there is no direct way to identify the directories whose container were removed.

::: suggestions
 * always inspect the docker images for volumes --format="{{.Volumes}}"
 * always "rm -v" even if multiple containers shares te volume, this vol won't be deleted until the last container sharing that data volume is removed.
 * preserve auto-generated directory, keeping a clear record, allowing their removal at any point of time.
 * implement an audit framework that will manage unused volumes (unassociated volumes and handle them)

2. Undesirable effect of data volume
    1. during build time, 
        performing create VOLUME <dir path>, 
        perform create file RUN <data> > <filepath>
        display file content RUN cat <filepath>
        
::: issues
in the build process, for every instruction in a Dockerfile, the following steps are followed:
1. Create a new container by translating the Dockerfile instruction to an equivalent docker run command
2. Commit the newly-created container to an image
3. Repeat step 1 & 2 by treating the newly created image as the base image for step 1 

::: suggestions
when a container is committed, it saves the container's filesystem and, deliberately, does not save the data volume's filesystem. Therefore, any data stored in the data volume will be lost in this process. So never use a data volume as storage during the build process.
        
        