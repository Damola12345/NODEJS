# start from base
FROM node:16-alpine

# make the directory on the Alpine Linux machine
RUN mkdir -p /app

# set working directory
WORKDIR /app

COPY package.json .
COPY package-lock.json .

# copy the application code to the working directory
COPY . .

# fetch app specific dependencies
RUN npm install

# expose port
EXPOSE 3000

# start run with this command
CMD [ "node", "app.js" ]

