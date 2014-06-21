# polipo docker image
polipo docker image for use as tor proxy.

## Build polipo docker image
```
git clone https://github.com/eg5846/polipo-docker.git
cd polipo-docker
sudo docker build -t eg5846/polipo-docker .

# Pushing image to registry.hub.docker.com is no longer required!!!
# Image build is automatically initiated after pushing commits of project to github.com
# sudo docker push eg5846/polipo-docker
```

## Run polipo docker image
```
sudo docker run -d -e TOR_EXITNODES="{ca}" -e POLIPO_ALLOWEDCLIENTS="127.0.0.0/8, 172.17.0.0/16, 192.168.178.0/24" -p 8118:8118 -P --name polipo -h polipo eg5846/polipo-docker
```

## TODO
```
- Do not run services tor and polipo with rights of root user
```
