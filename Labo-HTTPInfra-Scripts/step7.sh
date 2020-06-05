set -x

docker kill $(docker ps -aq)
docker rm $(docker ps -aq)

cd ../Teaching-HEIGVD-RES-2020-Labo-HTTPInfra/docker-images

git stash
git checkout master
git checkout upstream/fb-sticky-sessions

docker build -t res/apache_php apache-php-image
docker run --name apache_static_1 -d res/apache_php
docker run --name apache_static_2 -d res/apache_php

cd express-image/src/
npm install

cd ../..
docker build -t res/express express-image
docker run --name express_dynamic_1 -d res/express
docker run --name express_dynamic_2 -d res/express

ipStatic1=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' apache_static_1)
ipStatic2=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' apache_static_2)

ipDynamic1=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' express_dynamic_1)
ipDynamic2=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' express_dynamic_2)

dos2unix apache-reverse-proxy/apache2-foreground

docker build -t res/apache_rp apache-reverse-proxy
docker run --rm -d -p 8080:80 --name apache_rp -e STATIC_APP1=$ipStatic1:80 -e STATIC_APP2=$ipStatic2:80 -e DYNAMIC_APP1=$ipDynamic1:3000 -e DYNAMIC_APP2=$ipDynamic2:3000 res/apache_rp
