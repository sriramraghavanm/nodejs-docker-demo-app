## Test Cases

#### Test Case 1 -

Step 1: Pull MongoDB and Mongo Express images and spin a container from the image.

Step 2: Run node server.js and test the application. (Application is not yet containerized)

    docker pull mongo:latest
	docker pull mongo-express:latest
	docker images
	docker run -d -p 27017:27017 --name mongodb -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret --network mongo-network mongo
	docker run -d -it -p 8081:8081 --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb -e ME_CONFIG_MONGODB_ADMINUSERNAME=mongoadmin -e ME_CONFIG_MONGODB_ADMINPASSWORD=secret -e ME_CONFIG_MONGODB_PORT="27017" --network mongo-network mongo-express
	cd app/
	node server.js

#### Test Case 2 -

Step 1: Launch MongoDB and Mongo Express containers using docker-compose.

Step 2: Run node server.js and test the application. (Application is not yet containerized).

    docker-compose -f mongo.yaml up -d
	cd app/
	node server.js
	cd ..
	docker-compose -f mongo.yaml down
