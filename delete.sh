#!/bin/bash
echo -e "Delete Account."
read -p "Enter Username: " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e "The account $Pengguna has been deleted."
else
        echo -e "The User $Pengguna not found. Please enter the command - [member] to see all the username"
fi
