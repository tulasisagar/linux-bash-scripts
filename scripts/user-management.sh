#!/bin/bash

echo "----------------------------------------------------------------"
echo " "
echo "Script: User-Management.sh"
echo "User : $(whoami)"
echo "purpose : User Provisioning Automation"
echo " "
echo "-----------------------------------------------------------------"
echo " "
LOG_FILE=~/user-management.log
echo " "
echo "====================================="
echo "               USER-MANAGEMENT SCRIPT"
echo "====================================="
echo " "
echo "Enter user name : "
read USERNAME
echo "Username : $USERNAME"

if id "$USERNAME" &>/dev/null
then
   echo "user already exists !"
   exit 1
fi

sudo useradd "$USERNAME"

if [ $? -eq 0 ]
then
   echo "user created successfully"
else
   echo "Filed to create user name"
   exit 1
fi

echo "Enter group name:"
read GROUPNAME
echo "Group name: $GROUPNAME"

if getent group "$GROUPNAME" > /dev/null
then 
    echo "Group already exists"
else
    sudo groupadd "$GROUPNAME"
    echo "group created"
fi

sudo usermod -aG "$GROUPNAME" "$USERNAME"

if [ $? -eq 0 ]
then
   echo "User added to group successfully"
else
   echo "Failed to add user to group"
   exit 1
fi

echo " "
echo "$(date) - user: $USERNAME group: $GROUPNAME created succsessfully" >> "$LOG_FILE"

echo "  "
echo "======================================"
echo "            USER PROVISIONING COMPLETED"
echo "======================================"
