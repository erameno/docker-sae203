FROM debian:latest

# Installer des services et des packages
RUN  apt-get update && \
    apt-get -y install  \
    # apache2 \
    apt install apt-transport-https ca-certificates gnupg2 curl git -y \

    wget -O- https://repo.jellyfin.org/jellyfin_team.gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/jellyfin.gpg \
    echo "deb [arch=$( dpkg --print-architecture ) signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian bullseye main" | sudo tee /etc/apt/sources.list.d/jellyfin.list \
    apt update \
    apt install jellyfin -y \

    systemctl status jellyfin \
    systemctl run jellyfin \
    systemctl enable jellyfin \

# Copier les fichiers de l'hôte vers l'image
# COPY ./html /var/www/html

# Exposer le port 80
EXPOSE 80

# Lancer le service apache au démarrage du conteneur
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]