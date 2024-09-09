#!/bin/bash

# Set up Docker socket link
SOURCE_SOCKET=${2:-"/var/run/docker-host.sock"}
TARGET_SOCKET=${3:-"/var/run/docker.sock"}

echo "Linking Docker socket..."
sudo touch "${SOURCE_SOCKET}"
sudo ln -s "${SOURCE_SOCKET}" "${TARGET_SOCKET}"

# Download Couchbase installer
echo "Downloading Couchbase installer..."
wget https://packages.couchbase.com/cb-non-package-installer/cb-non-package-installer-x86_64

# Make it executable
chmod u+x ./cb-non-package-installer-x86_64

# Create install directory
echo "Creating Couchbase install directory..."
mkdir -p ./cb-install

# Download Couchbase server package
echo "Downloading Couchbase server package..."
wget https://packages.couchbase.com/releases/7.6.2/couchbase-server-community_7.6.2-linux_amd64.deb

# Run the Couchbase non-package installer
echo "Installing Couchbase..."
./cb-non-package-installer-x86_64 --install --install-location ./cb-install --package ./couchbase-server-community_7.6.2-linux_amd64.deb

# Start Couchbase server
echo "Starting Couchbase server..."
./cb-install/opt/couchbase/bin/couchbase-server --start

# Print confirmation
echo "Couchbase installation and setup completed."