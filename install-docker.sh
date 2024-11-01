 #!/bin/bash

# Update existing packages
sudo apt-get update -y

# Install prerequisite packages
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the Docker stable repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index with Docker packages from the new repository
sudo apt-get update -y

# Install the latest version of Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Start Docker and enable it to run at startup
sudo systemctl start docker
sudo systemctl enable docker

# Verify Docker installation
docker --version && echo "Docker installed successfully!" || echo "Docker installation failed!"




# To install Docker, save this script, make it executable, and run it:

# bash
# Copy code
# chmod +x install-docker.sh
# sudo ./install-docker.sh