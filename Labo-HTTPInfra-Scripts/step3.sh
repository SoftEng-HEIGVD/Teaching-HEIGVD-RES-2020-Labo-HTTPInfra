set -x

docker kill $(docker ps -aq)
docker rm $(docker ps -aq)

cd ../Teaching-HEIGVD-RES-2020-Labo-HTTPInfra/docker-images

git stash
git checkout master
git checkout upstream/fb-apache-reverse-proxy

docker build -t res/apache_php apache-php-image
docker run --name apache_static -d res/apache_php
echo "Static ip"
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' apache_static

cd express-image/src/
npm install

cd ../..
docker build -t res/express express-image
docker run --name express_dynamic -d res/express
echo "Express dynamic ip"
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' express_dynamic

docker build -t res/apache_rp apache-reverse-proxy
docker run --name apache_rp -d -p 8080:80 res/apache_rp
echo "Reverse proxy ip"
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' apache_rp

start chrome --incognito "http://demo.res.ch:8080"
start chrome --incognito "http://demo.res.ch:8080/api/animals/"