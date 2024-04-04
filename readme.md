1)install docker
2)open vs code terminal  docker --version.

3)make docker file
4)create docker image from docker file
docker build -t <image_name>:<tag> .
docker build -t vinay_portfolio_docker_image:v1.0 .
(or) 
docker build --no-cache -t vinayportfolio_docker_image:v1.0 .

Lets cross check kim image bani he ki nahin 
PS F:\HTML\CSS\Portfolio> docker images   
REPOSITORY                     TAG       IMAGE ID       CREATED          SIZE
vinay_portfolio_docker_image   v1.0      ad1609c60b10   22 seconds ago   50.5MB

5)now we will deploy imagefile into container 
docker run -d -p 8080:80 <image_name>:<tag> .
docker run -d -p 8080:80 vinay_portfolio_docker_image:v1.0 .


now cross check wherether container is runing or not 
docker ps

CONTAINER ID   IMAGE                               COMMAND                  CREATED              STATUS             PORTS                     NAMES
5d275a7df3b4   vinay_portfolio_docker_image:v1.0   "/docker-entrypoint.…"   About a minute ago   Up 22 minutes   0.0.0.0:8080->80/tcp   frosty_chaum

*)but if container is nnot running so check for all hidden 

docker ps

CONTAINER ID   IMAGE                               COMMAND                  CREATED              STATUS             PORTS                     NAMES

SO NOW RUN THIS COMMAND - 

docker ps -a

CONTAINER ID   IMAGE                               COMMAND                  CREATED              STATUS                               PORTS     NAMES
5d275a7df3b4   vinay_portfolio_docker_image:v1.0   "/docker-entrypoint.…"   About a minute ago   Exited (126) About a minute  ago                frosty_chaum

So now check kyu stop hjuya ??
docker logs CONTAINER ID
PS F:\HTML\CSS\Portfolio> docker logs 5d275a7df3b4
>>
/docker-entrypoint.sh: exec: line 47: .: Permission denied

*)So now lets create  image fresh again all process gain from start 

---turn off cobntainer 
docker rm 5d275a7df3b4
----remove image 
docker rmi vinay_portfolio_docker_image:v1.0 

--built fresh image with no cache
docker build --no-cache -t vinayportfolio_docker_image:v1.0 .

--run the docker container
docker run -d -p 8080:80 vinayportfolio_docker_image:v1.0

--check docker container i running or not 

docker ps

CONTAINER ID   IMAGE                              COMMAND                  CREATED          STATUS          PORTS                  NAMES
9d702c7e58e3   vinayportfolio_docker_image:v1.0   "/docker-entrypoint.…"   22 minutes ago   Up 22 minutes   0.0.0.0:8080->80/tcp   confident_poitras


6) now go to chrome 
http://localhost:8080/
<!-- 
7)now we will use the  consept of decker compose.this will insure that the replica and the health check 

*)create the docker compose file 
*)docker-compose build
*)docker compose up
*)docker images 

REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
nginx        alpine    e289a478ace0   5 weeks ago   42.6MB
to remove or clean cache (or any error occurs then )
docker system prune --all --force --volumes
docker-compose rm -f

*)PS F:\HTML\CSS\Portfolio> docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS              PORTS                  NAMES
364eab119283   nginx:alpine   "/docker-entrypoint.…"   3 minutes ago   Up About a minute   0.0.0.0:8081->80/tcp   portfolio-nginx-2
63978356ae93   nginx:alpine   "/docker-entrypoint.…"   3 minutes ago   Up About a minute   0.0.0.0:8082->80/tcp   portfolio-nginx-3
4190a1deee54   nginx:alpine   "/docker-entrypoint.…"   3 minutes ago   Up About a minute   0.0.0.0:8083->80/tcp   portfolio-nginx-1


*})to stop the server 
docker-compose down -->


8)Push the image to docker hub

docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
nginx        alpine    e289a478ace0   5 weeks ago   42.6MB

# Tag the image
docker tag vinayportfoli_docker_image:v1.0 vinayb2003/myportfolio:meri_image

cROSS CHECK => 
docker images
REPOSITORY               TAG       IMAGE ID       CREATED       SIZE
nginx                    alpine    e289a478ace0   5 weeks ago   42.6MB
vinayb2003/myportfolio   latest    e289a478ace0   5 weeks ago   42.6MB

# Log in to Docker Hub
docker login

# Push the image to Docker Hub
docker push vinayb2003/myportfolio:meri_image

9) Now go to AWS --> EC2(lINUX)-->
public ip : 13.236.86.40

Putty + PEM file 

Open putty +login to ec2 

- sudo yum install docker -y
- docker -v
- 



INSTALL DOCKER VIA COMMNADS : 
sudo yum update -y
sudo yum install docker -y
sudo systemctl status docker
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker

For permisssion issue :
sudo usermod -aG docker $USER
sudo usermod -aG docker ec2-user



sudo docker pull vinayb2003/myportfolio:latest





docker images 


sudo docker run -p 8080:80 vinayb2003/myportfolio:meri_image








**********************************************************

docker stop $(docker ps -q)

docker rm $(docker ps -a -q)

docker rmi $(docker images -a -q)

docker system prune --all --force --volumes

