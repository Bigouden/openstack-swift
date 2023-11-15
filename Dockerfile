FROM openstackswift/saio:latest
LABEL maintainer="Thomas GUIRRIEC <thomas@guirriec.fr>"
EXPOSE 8080
HEALTHCHECK CMD nc -vz localhost 8080 || exit 1 # nosemgrep
