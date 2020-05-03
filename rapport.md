# Laurent Thoeny - Res 2020 - Rapport

### Step 1

// todo : peut-être quelques commentaires

Rien de très différent de la vidéo n'a été fait mis à part le choix du template Boostrap et les modifications qui ont été apportées à ce dernier.

```
docker build -t res/apache_php .
docker run -p 9090:80 -d --name landingPage res/apache_php
```
