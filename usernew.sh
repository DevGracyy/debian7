#!/bin/bash
#Script auto create user SSH

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Information of Created Account" | lolcat
echo -e "Host: $IP"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "============================="
echo -e "Expiration Date: $exp"
echo -e "=============================" | lolcat
echo -e "DevGracyy Solution™"
echo -e ""
