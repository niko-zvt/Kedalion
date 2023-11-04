#! /bin/bash

# Create user

# Use:          sudo ./01_setup_user.sh <user_name>
# Example 1:    sudo ./01_setup_user.sh noname

ME=`basename "$0"`
USER_NAME=$1

# Print hello
echo "Script $ME started!"

# Add user
adduser $USER_NAME

# Add sudo rules
usermod -aG sudo $USER_NAME

# Test
# su - $USER_NAME
# exit

# Update and install sudo and nmap
apt update
apt install sudo -y
apt install nmap -y

# Check ports
nmap -sT -O localhost
nmap -sU localhost

# Open http and https ports