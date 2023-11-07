# Add user
adduser niko

# Add sudo rules
usermod -aG sudo niko

# Test
# su - $USER_NAME
# exit

# Update and install sudo and nmap
apt update
apt install sudo -y
apt install nmap -y
apt install git -y

# Check ports
nmap -sT -O localhost
nmap -sU localhost


# Open http and https ports