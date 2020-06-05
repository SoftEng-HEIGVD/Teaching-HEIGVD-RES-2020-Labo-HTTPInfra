set -x

docker kill $(docker ps -aq)
docker rm $(docker ps -aq)

cd ../Teaching-HEIGVD-RES-2020-Labo-HTTPInfra/docker-images

git stash
git checkout master
git checkout upstream/fb-ajax-jquery

docker build -t res/apache_php apache-php-image
docker run --name apache_static -d res/apache_php

cd express-image/src/
npm install

cd ../..
docker build -t res/express express-image
docker run --name express_dynamic -d res/express

docker build -t res/apache_rp apache-reverse-proxy
docker run -d --name apache_rp -p 8080:80 res/apache_rp

start firefox "http://demo.res.ch:8080"
