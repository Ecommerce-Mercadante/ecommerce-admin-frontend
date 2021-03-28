FROM node:14.16.0-alpine3.11 as base

RUN apk add shadow openssl bash git

RUN touch /home/node/.bashrc | echo "PS1='\w\$ '" >> /home/node/.bashrc

RUN npm config set cache /var/www/.npm-cache --global

RUN usermod -u 1000 node

WORKDIR /var/www

USER node
# -------------- #
FROM base as dev

USER root

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ADD ./frontend-admin/.docker/app/.env /templates/.env
ADD ./frontend-admin/.docker/app/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER node
