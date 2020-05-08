# MATTEI SIMON : Rapport Labo HTTP

## Partie 1 : Configuration serveur apache

Image Docker utilisée : `php:7.2.30-apache` - https://hub.docker.com/layers/php/library/php/7.2.30-apache/images/sha256-8b1a97fafd2ebf432658b4fdbaadd0d0531d1c55550d3ae9b8d77896697acb17?context=explore

Adresse IP de docker toolbox\
![](Images/AdrrIPToolbox.png)

Premier lancement du serveur apache
![](Images/PremierLancementServeurApache.png)

Première Connexion, Serveur vide\
![](Images/PremiereConnexion.png)


### Configuration serveur perso

Dockerfile
```
FROM php:7.2.30-apache
COPY srcHTML/ /var/www/html/
```

srcHTML doit se trouver dans le même dossier que le Dockerfile, qui va ensuite copier les ressources pour les envoyer dans le dossier html du serveur apache 7.2.30, qui est le dossier défini par la configuration par défaut du fichier ```/etc/apache2/sites-enable/000-default.conf```

Pour créer une image depuis le Dockerfile, puis ensuite créer un ou plusieurs containers
```
docker build -t <IMG_NAME> <PATH_TO_DOCKERFILE> 
docker run -d -p <PORT>:80 <IMG_NAME>
```

Dans le cas ou mon port est 7778 et mon localhost 192.168.99.101
![](Images/finalStep1.png)

## Partie 2 : Serveur HTTP dynamique avec express.js

### 2.1 : Configuration de Node.js

Image Docker utilisée : `node:12.16.3`

DockerFile
```
FROM node:12.16.3
COPY src /opt/app
CMD ["node","/opt/app/index.js"]
```

fichier package.json, crée grâce à l'utilitaire `npm` de node
```json
{
  "name": "tryingtomakethiswork",
  "version": "1.0.0",
  "description": "part 2 for my lab",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "Simon Mattei",
  "license": "ISC",
  "dependencies": {
    "chance": "^1.1.4"
  }
}
```

index.js
```javascript
var Chance = require('chance');
var chance = new Chance();

console.log("Gnar's birthday is on " + chance.birthday())
```

Arborescence des fichiers

![](Images/ArborescenceNode.png)

Exécution de l'image

![](Images/ExecutionNode.png)