
``` 
### Linking containers

# to link a source container to a recipient container
docker run --link <container>:<alias> <recipient-container-to-run> 
# <container> :  name of the source container
# <alias> : name seen by the recipient container

## category of environment variables:
   type     key_format                          sample (key=value)
1. NAME:    <ALIAS>_NAME =>                     <ALIAS>_NAME=<path>                     
    it carries the recipient container's hierarchical name as its value.
2. ENV:     <ALIAS>_ENV_<VARNAME>               <ALIAS>_ENV_<VARNAME>
    exports the env var configured in the source container by the -e option of docker run or ENV at Dockerfile
3. PORT:    *<ALIAS>_PORT_<port>_<protocol>     *<ALIAS>_PORT_8080_TCP=tcp://172.17.x.x:8080
    exports by docker run -p option or EXPOSE of Dockerfile.
    can be handled separately splitted into: ..._ADDR, ..._PORT, ..._PROTO.
    
::: docker automatically updates the source IP address &
::: its alias as an entry in the recipient's "/etc/hosts"
::: container linking exports the source container's env variables, which are configured using the -e option of the docker run subcommand or the ENV (Dockerfile) to the recipient container.
::: container linkage does decouple the env vars during modifications they are seldom independent, they are set during launch time of the source container.
::: any change of the env vars after its launched has no effect on the recipient container. its values are read from a JSON file.

### Orchestrating containers




### Container orchestration using the docker-compose tool



```


1. Docker orchestration platforms
    * helios
    * decking
    * flocker
    * kubernates
    * fig => rebranded to docker-compose
    * ...
    