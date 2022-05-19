FROM debian:latest

# Installer des services et des packages
RUN apt-get update && \
    apt-get -y install
RUN    apt-get upgrade -y

RUN    apt install apt-transport-https ca-certificates gnupg2 curl git -y 

RUN apt install wget

RUN apt install apt-transport-https

RUN    wget -O- https://repo.jellyfin.org/jellyfin_team.gpg.key | gpg --dearmor | tee /usr/share/keyrings/jellyfin.gpg
RUN    echo "deb [arch=$( dpkg --print-architecture ) signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian bullseye main" | tee /etc/apt/sources.list.d/jellyfin.list


RUN     apt-get update
      
RUN     apt-get install jellyfin -y
RUN     apt-get install systemctl -y

RUN     systemctl enable jellyfin
RUN     systemctl start jellyfin

RUN     systemctl status jellyfin


# Exposer le port 96
EXPOSE 96

