# kics-scan disable=02d9c71f-3ee8-4986-9c27-1a20d0d19bfc,67fd0c4a-68cf-46d7-8c41-bc9fba7e40ae
FROM openstackswift/saio:py3
LABEL maintainer="Thomas GUIRRIEC <thomas@guirriec.fr>"
COPY --link --chmod=755 init_ci.sh healthcheck.sh pip_packages /
RUN pip install --no-cache-dir --requirement pip_packages
EXPOSE 8080
HEALTHCHECK CMD /healthcheck.sh
# hadolint ignore=DL3002
USER root
