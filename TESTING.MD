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
	
#### Test Case 3 -

Step 1: Launch MongoDB and Mongo Express containers without docker-compose in 'mongo' network.

Step 2: Build the Dockerfile and create an image for our app.

Step 3: Launch the app inside the container in the same 'mongo' network and test the application.

    	In Dockerfile modify the last line as - CMD ["node", "app-image-server.js"]
	docker build . -t myapp:1.0
	docker images
	docker run -d -p 27017:27017 --name mongodb -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret --network mongo-network mongo
	docker run -d -it -p 8081:8081 --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb -e ME_CONFIG_MONGODB_ADMINUSERNAME=mongoadmin -e ME_CONFIG_MONGODB_ADMINPASSWORD=secret -e ME_CONFIG_MONGODB_PORT="27017" --network mongo-network mongo-express
	docker run -d -it --name myapp-container -p 3000:3000 --network mongo-network myapp:1.0
	Stop all the containers
	In Dockerfile modify the last line as - CMD ["node", "server.js"]
