Trend:  instead of large monolithic applications hosted on a single physical or virtual server, companies are building smaller, self-defined, easily manageable, and discrete service to be contained inside standarized and automated containers. 

1. goto service source dir
cd <docker-compose.yml parent directory>

2. build the service container 
sudo docker-compose build

3. bring up the service
sudo docker-compose up

4. check the service status or list the containers associated with service.
sudo docker-compose ps
