# Laurent Thoeny - Res 2020 - Rapport

_Disclaimer : Désolé j'avais peur de ne pas pousser quelques choses d'utile alors il y a également toute la "polution" made in NodeJS sur mon repo._

### Step 1 - Static HTTP server with apache httpd

Rien de très différent de la vidéo n'a été fait mis à part le choix du template Boostrap et les modifications qui ont été apportées à ce dernier.

Les commandes notables utilisées sont ci-dessous 

```bash
docker build -t res/apache_php .
docker run -p 9090:80 -d --name landingPage res/apache_php
```

### Step 2 - Dynamic HTTP server with express.js

Ici il est important de préciser que j'ai créé la branche depuis master car j'ai merge ma première branche sur Master entre temps. En espérant que cette différence de workflow ne dérange pas.

La plupart des autres manipulations reste très similaires aux deux vidéos, rien de particulier à commenter.

Ci-dessous ma fonction JavaScript, qui n'est pas la plus originale mais diffère de celle présentée.

```javascript
function getRandomAnimals()
{
    var numberOfAnimals = chance.integer({min : 1, max : 20});

    var animals = [];

    for (var i = 0; i < numberOfAnimals; ++i)
    {
        animals.push({
            animal : chance.animal(), 
            quantity : chance.integer({min : 1, max : 12})
        });
    }

    console.log("About to return some animals o/");
    return animals;
}
```



### Step 3