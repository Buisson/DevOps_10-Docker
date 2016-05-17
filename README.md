DevOps_10-Docker
=============

 ------
Image dotnet :
-----
####Etape 1 
il faut soit :
 + construire l’image a partir du fichier docker présent à la racine du projet.

    ```
    sudo docker build -t buissonmagique/dotnet . //ne pas oublier le point
    ```
 + utiliser l’image déjà présente sur le hub docker          
    
    ```
    sudo docker pull buissonmagique/dotnet  
    ```
####Etape 2 
une fois l’image en votre possession il ne vous reste plus qu’a la lancer dans un conteneur docker :

    sudo docker run -it --net=host buissonmagique/dotnet
##### Les options :
+ -i , afin que le dotnet soit lancé en mode interactif
+ --net=host, permet au conteneur de définir sur qu’elle réseau il se trouve afin de pouvoir communiqué avec les autres éléments présents.

Image backend :
-----

Il s’agit ici de répéter les étapes précédentes en utilisant le dockerfile qui se trouve dans le dossier j2e afin de crée l’image ou l’image deja construite qui se trouve sur le hub docker 


    sudo docker build -t buissonmagique/backend .

`ou`

    sudo docker pull buissonmagique/backend

Il ne vous reste ensuite plus qu'a run

    sudo docker run -it --net=host buissonmagique/backend

BDD :
-----
+ On creer le volume 
    
    ```
    sudo docker create -v /bdd --name bddJ2E buissonmagique/backend /bin/true
    ```

+ On run l'image :
    
    ```
    sudo docker run -it --net=host --volumes-from bddJ2E buissonmagique/backend
    ```
+ Pour clean le volume :

    ```
    sudo docker rm -v bddJ2E
    ```
+ Pour lancer le compose :

    `Pour composer les deux images docker il faut avoir préalablement crée le volume.`

    Pour composé les deux images docker crée precedament il vous suffit d’utiliser le fichier .yml se trouvant a la racine du projet. Pour ce faire utilisez la commande `up` de `docker-compose`

    ```
    sudo docker-compose up
    ```
