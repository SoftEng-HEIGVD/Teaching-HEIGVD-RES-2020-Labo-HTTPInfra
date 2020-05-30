#!/bin/bash

# On bruteforce un stop si nécessaire
docker stop portainer

# On efface l'actuel container à ce nom
docker rm portainer

# On lance le container avec les bons labels et tout :)
docker run -d --name=portainer \
	--label "traefik.http.routers.portainer.rule"="Host(\`admin.res.ch\`)" \
	--label "traefik.http.services.portainer.loadbalancer.server.port"="9000" \
	--restart=always \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer_data:/data portainer/portainer
