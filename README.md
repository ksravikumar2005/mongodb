    This is the Docker Image for Mongo 4.2 On CentOS 7.6

    For the Impatient:

    To quickly get a single instance of the MongoDB up and Running, the command is:
    mkdir -p /data/db; chown -R 1000:1000 /data/db
    docker run -d -v /data/db:/data/db -p 27017:27017 ksravikumar2005/mongodb:latest

    To Build a docker image from scratch, the command is:

    1. Clone the Dockerfile from the git repo below:

    git clone https://github.com/ksravikumar2005/mongodb.git
    
    2. Switch to the mongodb directory and build the image with the tag imagename:tag

      cd mongodb/
      docker build -t <imagename:tag> .
    
    3. Verify the image built using the command

      docker images

    4. To persist the Mongo Data to the disk volume, create a folder of your choice to use for later volume mounting.

      mkdir -p /data/db
      chown -R 1000:1000 /data/db

    5. Time to stand up our first Mongo Container  

       docker run -d -v /data/db:/data/db -p 27017:27017 --name=myfirstmongo <imagename:tag>
     
    6. Verify the image is running using the below commands; you should see a line that says: aiting for connections on port 27017

       docker logs myfirstmongo

    7. Invoke the container shell to view mongo databases

       docker exec -it myfirstmongo /bin/bash

    8. Drop into mongo shell using the command "mongo" andee execute the command show databases; 

     docker exec -it myfirstmongo /bin/bash
     
    [mongodb@079f6c3469d2 /]$ mongo
    MongoDB shell version v4.2.0
    connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
    Implicit session: session { "id" : UUID("c3e122a0-2749-4ef2-a342-3db18b65bd23") }

    > show databases;
    admin   0.000GB
    config  0.000GB
    local   0.000GB
    >
    
    9. To conntect to this service externally, use a mongo client and configure it to connect to your hostname:27017
    
    10. Visit https://www.katacoda.com/ksravikumar2005/scenarios/mongodb to see this in action without any setup, right from your browser in less than 5 minutes! 
    
    10. Enjoy!
