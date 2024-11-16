#!/bin/bash

read -p "Write username: " username

sudo adduser $username
sudo -u $username chmod 700 /home/"$username"

sudo -u $username ssh-keygen -f /home/"$username"/.ssh/"$username"
sudo -u $username chmod 700 /home/"$username"/.ssh
sudo -u $username chmod 600 /home/"$username"/.ssh/"$username".pub

sudo -u $username touch /home/"$username"/.ssh/authorized_keys
sudo -u $username chmod 660 /home/"$username"/.ssh/authorized_keys

sudo -u $username cat /home/"$username"/.ssh/"$username".pub | sudo -u $username tee -a /home/"$username"/.ssh/authorized_keys > /dev/null

sudo -u $username chmod 600 /home/"$username"/.ssh/authorized_keys
