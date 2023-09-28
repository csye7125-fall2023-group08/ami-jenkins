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


# Install Caddy
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy


# Edit Caddy file for reverse proxy
sudo sh -c 'cat <<EOL > /etc/caddy/Caddyfile
jenkins.csye7125-mm.net {
    reverse_proxy localhost:8080
}

jenkins.vaibhavmahajan.in {
    reverse_proxy localhost:8080
}

jenkins.rebeccabiju.pro {
    reverse_proxy localhost:8080
}
EOL'


# Start Caddy
sudo service caddy restart

# Print jenkins admin password for UI use
INITIAL_ADMIN_PASSWORD_FILE="/var/lib/jenkins/secrets/initialAdminPassword"
JENKINS_INITIAL_ADMIN_PASSWORD=$(sudo -s cat "$INITIAL_ADMIN_PASSWORD_FILE")
echo "jenkins_initial_admin_password = $JENKINS_INITIAL_ADMIN_PASSWORD"


