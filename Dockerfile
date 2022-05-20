FROM debian:latest

# Installer des services et des packages
RUN apt update && \
   apt upgrade -y && \
   apt install apt-transport-https ca-certificates gnupg2 curl git wget -y

RUN    wget -O- https://repo.jellyfin.org/jellyfin_team.gpg.key | gpg --dearmor | tee /usr/share/keyrings/jellyfin.gpg
RUN    echo "deb [arch=$( dpkg --print-architecture ) signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian bullseye main" | tee /etc/apt/sources.list.d/jellyfin.list


# COPY ./video /var/media/jellyfin
# COPY ./cache /var/cache/jellyfin
# COPY ./config /var/config/jellyfin
# COPY ./lib /var/lib/jellyfin


EXPOSE 8096

RUN     apt-get update
RUN     apt-get install jellyfin -y


CMD ["/usr/bin/jellyfin", \
"--datadir", "/var/lib/jellyfin", \
"--cachedir", "/var/cache/jellyfin", \
"--webdir", "/usr/share/jellyfin/web", \
"--ffmpeg", "/usr/lib/jellyfin-ffmpeg/ffmpeg"]

