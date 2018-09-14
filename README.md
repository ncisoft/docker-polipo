# docker-polipo 
Dockerfile for polipo (tor proxy)

## Build polipo docker image
```
git clone https://github.com/eg5846/docker-polipo.git
cd docker-polipo
sudo docker pull ubuntu:bionic
sudo docker build -t polipo .
```

## Run polipo docker container 
```
sudo docker run -d --restart=always -e TOR_EXITNODES={ca} -P --name tor tor
sudo docker run -d --restart=always -e POLIPO_ALLOWEDCLIENTS="127.0.0.0/8, 172.17.0.0/16, 192.168.128.0/24" -p 8118:8118 --link tor:tor --name polipo polipo
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
sudo docker run --rm -t --volumes-from polipo polipo cat /var/log/polipo/polipo.log
```

## TODO
* Process polipo logs with logstash
* Do not run polipo daemon with root rights
