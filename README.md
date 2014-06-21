# polipo docker image

## Build polipo docker image
```
sudo docker build -t eg5846/polipo-docker .
```

## Run polipo docker image
```
sudo docker run -d -e TOR_EXITNODES="{ca}" -e POLIPO_ALLOWEDCLIENTS="127.0.0.0/8, 172.17.0.0/16, 192.168.178.0/24" -p 8118:8118 -P --name polipo -h polipo eg5846/polipo-docker
```

## TODO
```
- Do not run services tor and polipo with rights of root user
```
