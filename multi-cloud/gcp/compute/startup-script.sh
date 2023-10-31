#!/bin/bash

# Create the "ansible" user
useradd ansible

# Set the password for the "ansible" user (replace "rocket" with your desired password)
echo "ansible:rocket" | chpasswd

# Add the "ansible" user to the sudo group
echo "ansible  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

# Edit sshd_config to enable password authentication
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart the SSH service to apply the changes
systemctl restart sshd.service
