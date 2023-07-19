FROM node:lts-alpine

RUN mkdir /app
WORKDIR /app

ENV NODE_ENV=production

COPY package.json .

# install latest version of npm
RUN npm install -g npm@9.8.0

#RUN npm install npm@latest

# install latest version of sourcemap-codec lib
RUN npm install @jridgewell/sourcemap-codec

RUN npm install --silent --progress=false --production --ignore-scripts

COPY . .

CMD ["npm", "start"]
