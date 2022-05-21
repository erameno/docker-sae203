# docker-sae203

Instruction d'installation 
=


- Cloner le réféfrentiel dans le dossier de votre choix  :

**git clone git@github.com:erameno/docker-sae203.git**



- Se positionner dans le répositoire : 

**cd docker-sae203** 

*Cette commande est à effectuer au même endroit où vous avez décidé de cloner le répositoire* 



- Construction du conteneur :

**docker build -t <leNomDeVotreImage>** 

  
- Lancement du service 
  
**docker run --name docker_jelly -d -p 8096:8096 -v ${PWD}/video:/var/media/jellyfin -v ${PWD}/config:/var/lib/jellyfin -v ${PWD}/cache:/var/cache/jellyfin <leNomDeVotreImage>**
  
  
Une fois le service lancé 
=
  
- Aller sur votre naviguateur et écrire dans l'adresse URL **localhost:8096**
  
- Sur la page de connexion, saississez comme nom d'utilisateur "user" et faites entrée.
  Vous êtes désormais connecté. 
  
  
