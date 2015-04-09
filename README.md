# docker-nodes
Spawn N docker nodes on Vagrant. 

Docker instances will use ip starting from 192.168.50.6 up to N on port 2375/tcp

```bash
DOCKER_INSTANCES=N vagrant up
docker -H 192.168.50.6:2375 ps
```


