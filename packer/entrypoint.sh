#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y

# Install Java (required for Jenkins)
sudo apt-get install -y default-jre


# Install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y


# Enable jenkins for autostart
sudo systemctl enable jenkins
sudo systemctl start jenkins


# Install Nginx
sudo apt-get update
sudo apt-get install nginx -y

sudo cp -f /home/ubuntu/ami-jenkins/packer/nginx.conf /etc/nginx/

# Edit Nginx file for reverse proxy
printf "%s" "$PUBLIC_KEY" > /home/ubuntu/fullchain.pem
printf "%s" "$PRIVATE_KEY" > /home/ubuntu/privkey.pem

# Start Caddy
sudo systemctl enable nginx
sudo systemctl restart nginx

# Print jenkins admin password for UI use
INITIAL_ADMIN_PASSWORD_FILE="/var/lib/jenkins/secrets/initialAdminPassword"
JENKINS_INITIAL_ADMIN_PASSWORD=$(sudo -s cat "$INITIAL_ADMIN_PASSWORD_FILE")
echo "jenkins_initial_admin_password = $JENKINS_INITIAL_ADMIN_PASSWORD"


