# DEVOPS: Dockerizing a  DApp for Sell and Buy real estates based on Blockchain technology and Microservices architecture JAVA SpringBoot and Angular
 ## code source of the application : https://github.com/ElabdiAchraf/DApp-Sell-and-Buy-real-estates
 ## description :
 ### with Docker using two approaches:
  -   #### Approache one : standalone container
  
      A single container running all the processes necessary for the operation of the application (use a Bash entrypoint with the supervisord tool).
      
  -   #### Approache tow : multi-container 
  
      Several containers including one for each service used by the application (multi-container Docker applications). For that I use the docker-compose tool.
      - environment variables configuration
      - Bash scripts "entrypoint.sh" that allow to reconfigure the application, to pass environment variables, to replace the hardcoded configuration with GNU filters, and to start processes
      - based the official Ubuntu image ubuntu:focal to create all Docker images for all containers (without using the application images proposed on docker hub).
    
