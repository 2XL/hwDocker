
# Comment

FROM busybox:latest

MAINTAINER Mr. Chenglong <chenglong.zq@gmail.com>

COPY html /var/www/html
COPY httpd.conf magic /etc/httpd/conf/

# ADD tarfile.tar / # <src> ... <dst>, src can be either tar bundle or remote URL, ... multiple source file can be specified, dst, dst == target dir in the image fs

ENV DEBUG_LVL 3 # <key> <value>
ENV APACHE_LOG_DIR /var/log/apache

# USER 73 # <UID>|<UName>,  specify startup userid or a valid username

WORKDIR /var/log # <dirpath>, changes the current working directory from / (root) to specified by instruction.

VOLUME /home/milax # ["<mountpoint>"] | <mountpoint>,  creates a directory in the image fs

EXPOSE 7373/udp 8080 # <port>[/<proto>, tcp (default) or udp] ...,  opens up a container network port for communincating between cont. and host.

RUN echo "echo Welcome to Docker!" >> /root/.bashrc

RUN apt-get update && apt-get install -y apache2 && apt-get clean

RUN ["bash", "-c", "rm", "-rf", "/tmp/abc"] # <command>|["<cmd>","<arg>", ... ] # instruction performed during build time, aka running with /bin/sh -c

# diff between RUN(build time) and CMD(runtime, only the last command is called)


CMD echo ### Hello world!! ###
