


```

# build the image
sudo docker build -t apache2 .


# run the image as a service
sudo docker run -d apache2


# retrieve the service ip
sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' <instance-id>
# 172.17.x.x

# query the service home page
wget -qO - 172.17.x.x

# port forwarding with RUN subcommand -p

# <hostPort>:<containerPort> # meta ip, static port
# <containerPort> # meta ip, autogen port
# <ip>:<hostPort>:<containerPort> # restrict ip, static port
# <ip>::<containerPort> # restrinct ip, autogen port

# ip => @ of the docker host
# hostPort => docker host port number
# 

sudo docker run -d -p 80:80 apache2

# Network Address Translation from containers analysis
sudo iptables -t nat -L -n

# 0.0.0.0/0 => meta ip => the source/destination connection can originate/target from/to any IP address 

<!--Chain DOCKER (2 references)-->
<!--target     prot opt source               destination         -->
<!--RETURN     all  --  0.0.0.0/0            0.0.0.0/0           -->
<!--DNAT       tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:80 to:172.17.0.2:80-->

# Any tcp packet that the Docker host receives on port 80 will be forwareded to port 80 of the container

sudo docker port <instance-id> <port> # retrieves the container port binded
# 0.0.0.0:<port> reponse that the instance-id port is visible to any container from the docker host.


# binding only to the docker host instead of all the docker containers

sudo docker run -d -p <dockerhostip>:<dockerhostport>:<containerport> <containername>

# auto generating docker host port

sudo docker run -d -p 80 apache2 # auto-port assignment ==> to achieve service auto-scaling
# this fashion would be interfaced with a proxy or load balancing service on a predefined port.

sudo docker inspect --format='{{.Config.ExposedPorts}}' apache2

sudo docker run -d -P apache2 # -P option is used to create the port binding in the docker host for all the port declared

```