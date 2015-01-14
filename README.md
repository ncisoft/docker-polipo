# polipo docker image
polipo docker image for use as tor proxy.

## Build polipo docker image
```
git clone https://github.com/eg5846/polipo-docker.git
cd polipo-docker
sudo docker build -t eg5846/polipo-docker .

# Pushing image to registry.hub.docker.com is no longer required!!!
# Image build is automatically initiated after pushing commits of project to github.com.
# sudo docker push eg5846/polipo-docker
```

## Run polipo docker container 
```
sudo docker run -d -e TOR_EXITNODES={ca} -P --name tor -h tor eg5846/tor-docker
sudo docker run -d -e POLIPO_ALLOWEDCLIENTS="127.0.0.0/8, 172.17.0.0/16, 192.168.178.0/24" -p 8118:8118 --link tor:tor --name polipo -h polipo eg5846/polipo-docker
```

## Inspect polipo docker container
```
# Show stdout
sudo docker logs polipo

# Run bash inside container
sudo docker exec -it polipo /bin/bash
cat /var/log/polipo/polipo.log
exit

# Access logfile on volume directly
docker run --rm -t --volumes-from polipo eg5846/ubuntu-docker:trusty cat /var/log/polipo/polipo.log
```

## TODO
* Process polipo logs with logstash
* Do not run polipo daemon with root rights
