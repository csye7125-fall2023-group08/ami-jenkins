# AMI-Jenkins
Creates the AMI for jenkins instance with necessary commands.

- Jenkins is being run on docker in the AMI
- The Configuration as Code is used to configure Jenkins and pass credentials and jobs to the Jenkins environment
- We have used docker-compose since the docker file would not run automatically when the instance would be restarted. So while launching instances, we have passed the command `docker compose up` in the user-data of the instance
- Plugins.txt file has the necessary plugins for Jenkins
- We have used Multibranch Pipeline and defined the groovy scripts for each repository

### Steps to Build AMI
```shell
packer init packer
```
```shell
packer build packer
```

### Steps to Build run Docker locally and use Jenkins on server
1. Replace the values in `.docker.env` with your credentials
2. Remove the mounted docker volume in `docker-compose.yaml`
3. Uncomment the docker isntallation in `Dockerfile`. Due to security issues in Mac (docker pointing to the link of the binary and the actual path of binary is not accessible), Jenkins running on Docker container of our local machine cannot access docker, so we need to install Docker in the image
4. `docker compose build` and `docker compose up` to run the container