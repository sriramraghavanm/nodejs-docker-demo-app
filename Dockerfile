# Use the official Node.js:20 image as the base image
FROM node:20

ENV MONGO_DB_USERNAME=mongoadmin \
    MONGO_DB_PWD=secret

RUN mkdir -p /home/app

WORKDIR /home/app

# Copy the application code to the container
COPY ./app .

# Install the application dependencies
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]