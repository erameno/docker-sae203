# SAE 2.03 : Installation de services réseau

Présentation du projet : 
=
## Organisation 
Nous avons donc décidé de créer un service de vidéo à la demande car c'est le sujet qui nous a le plus intéressés. 
Afin de créer ce service, nous avons utilisé Jellyfin, qui est un serveur multimédia permettant de mettre en ligne les vidéos que nous souhaitons.

Pour commencer le travail, nous avons répartis les tâches entre chaques membres du groupe. 
  - Une personne devait donc se charger de trouver des vidéos, nous avons choisi de poster des bandes annonces de films.
  - Deux personnes se sont donc occupées de configurer Jellyfin comme il fallait.
  - La dernière personne s'est assurée que tout le monde soit synchronisé avec le repository gitHub afin que nous puissions travailler de la meilleure manière possible et dans les meilleures conditions.
  
Au final, nous avons pu obtenir le résultat escompté puisque nous avons un service de vidéo à la demande qui fonctionne bien.

## Le DockerFile
Afin de rendre l'accès possible à tous de notre projet, nous avons du utiliser un fichier DockerFile.

Un DockerFile va définir les différentes étapes que l'ordinateur va suivre afin de modifier l'image que nous souhaitons créer. 

La première commande est : 
```RUN apt update &&\apt upgrade -y &&\apt install apt-transport-https ca-certificates gnupg2 curl git wget -y``` 

_Cette commande sert dans un premier temps à mettre à jour le système Debian, puis ensuite d'installer les paquets requis afin que Jellyfin soit entièrement fonctionnel et qu'il n'y ai pas de bugs.  _

La seconde instruction est : 
```sudo wget -O- https://repo.jellyfin.org/jellyfin_team.gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/jellyfin.gpg``` 

_Cette commande sert à importer la clé GPG qui sert à vérifier le paquet installé précedemment, afin que l'installation ne pose aucun porblèmes._

La troisième étape va être d'importer le référentiel de Jellyfin en version stable :
```echo "deb [arch=$( dpkg --print-architecture ) signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian bullseye main" | sudo tee /etc/apt/sources.list.d/jellyfin.list```

La commande : ```EXPOSE 8096```sert à donner à Jellyfin le port sur lequel il sera accessible.

Ensuite, nous remettons tout à jour pour vérifier que tout fonctionne : 
```sudo apt update```

L'étape suivante est d'installer le serveur Jellyfin, afin de pouvoir héberger nos vidéos : 
```sudo apt install jellyfin -y```

Après cela, Jellyfin est installé et est prêt à être utilisé pour notre projet. 









  
