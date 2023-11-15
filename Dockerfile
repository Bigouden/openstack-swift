# kics-scan disable=67fd0c4a-68cf-46d7-8c41-bc9fba7e40ae,f45ea400-6bbe-4501-9fc7-1c3d75c32067
# hadolint ignore=DL3007
# nosemgrep
FROM openstackswift/saio:latest
LABEL maintainer="Thomas GUIRRIEC <thomas@guirriec.fr>"
EXPOSE 8080
HEALTHCHECK CMD nc -vz localhost 8080 || exit 1
# hadolint ignore=DL3002
USER root # nosemgrep
