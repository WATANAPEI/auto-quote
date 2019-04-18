FROM node:8.10.0

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app

COPY package.json webpack.config.js $HOME/nodeapp/
COPY client $HOME/nodeapp/client

RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/nodeapp
RUN npm install
RUN npm run dev

USER root
COPY . $HOME/nodeapp
RUN chown -R app:app $HOME/*
USER app




