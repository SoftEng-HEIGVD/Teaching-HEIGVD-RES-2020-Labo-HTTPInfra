set -x

docker kill $(docker ps -aq)
docker rm $(docker ps -aq)

cd ../Teaching-HEIGVD-RES-2020-Labo-HTTPInfra/docker-images

git stash
git checkout master
git checkout upstream/fb-dynamic-configuration

docker build -t res/apache_php apache-php-image
docker run --name apache_static -d res/apache_php
docker run -d res/apache_php
docker run -d res/apache_php

cd express-image/src/
npm install

cd ../..
docker build -t res/express express-image
docker run --name express_dynamic -d res/express
docker run -d res/express
docker run -d res/express

ipStatic=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' apache_static)
ipDynamic=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' express_dynamic)

dos2unix apache-reverse-proxy/apache2-foreground

docker build -t res/apache_rp apache-reverse-proxy
docker run --rm -d -p 8080:80 --name apache_rp -e STATIC_APP=$ipStatic:80 -e DYNAMIC_APP=$ipDynamic:3000 res/apache_rp

start chrome --incognito "http://demo.res.ch:8080"
start chrome --incognito "http://demo.res.ch:8080/api/animals/"