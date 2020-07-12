FROM ich777/debian-baseimage

LABEL maintainer="admin@minenet.at"

ENV PUSHOVER_APP_TOKEN=""
ENV PUSHOVER_USER_TOKEN=""
ENV PUSHOVER_TITLE="Startup Complete"
ENV PUSHOVER_MESSAGE="Server is now Online!"
ENV PUSHOVER_PRIORITY="0"
ENV UID=99
ENV GID=100
ENV DATA_PERM=770
ENV USER="pushover"

RUN useradd -s /bin/bash $USER

ADD /scripts/ /opt/scripts/
RUN chmod -R 777 /opt/scripts/

#Server Start
ENTRYPOINT ["/opt/scripts/start.sh"]