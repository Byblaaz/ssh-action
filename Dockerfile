FROM appleboy/drone-ssh:1.6.8-linux-amd64

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 16.13.0
RUN apk add --update nodejs npm
#RUN node --version
#RUN npm --version

RUN apk --no-cache add curl
RUN apk add bash
# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

#RUN npm config delete prefix
#RUN npm config set prefix $NVM_DIR/versions/node/v16.13.0

##&& nvm alias default $NODE_VERSION \

#RUN node --version
# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && npm config delete prefix \
    && npm config set prefix $NVM_DIR/versions/node/v16.13.0 \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

RUN node --version
RUN echo "clc fort"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
