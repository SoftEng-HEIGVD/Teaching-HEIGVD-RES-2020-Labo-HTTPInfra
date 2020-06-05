set -x

docker kill $(docker ps -aq)
docker rm $(docker ps -aq)

cd ../Teaching-HEIGVD-RES-2020-Labo-HTTPInfra/docker-images

git stash
git checkout master
git checkout upstream/fb-matt989253-apache-static

docker build -t res/apache_php apache-php-image
docker run -d -p 9090:80 res/apache_php

start chrome --incognito "192.168.99.100:9090"
