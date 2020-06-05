set -x

docker kill $(docker ps -aq)
docker rm $(docker ps -aq)

cd ../Teaching-HEIGVD-RES-2020-Labo-HTTPInfra/docker-images

git stash
git checkout master
git checkout upstream/fb-matt989253-express-dynamic

cd express-image/src/
npm install

cd ../..
docker build -t res/express express-image
docker run -d -p 9090:3000 res/express

start chrome --incognito "192.168.99.100:9090"
