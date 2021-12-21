#!bin/bash
#Coded by 7ife
clear
echo ""
echo -e "\033[1;94m ‎"
echo "${k}████████╗ ██████╗ ██████╗  █████╗ ";
echo "${k} ══██╔══╝██╔════╝ ██╔══██╗██╔══██╗";
echo "${k}   ██║   ██║  ███╗██████╔╝███████║";
echo "${k}   ██║   ██║   ██║██╔══██╗██╔══██║";
echo "${k}   ██║   ╚██████╔╝██████╔╝██║  ██║";
echo "${k}   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝  ╚═╝";
echo ""                                 
echo -e "\033[1;90m  Github: github.com/7ife"
echo -e "\033[1;90m  E-mail: 7ife@pm.me"
echo ""
echo -e "\033[1;94m::TGBot:for:Android::"
sleep 2
echo ""
echo -e ""
echo -e $'\e[1;34m::TGBA::\e[0m\e[1;32m #Installing Dependencies\e[0m'
sleep 2
apt install wget -y
apt install nginx -y
apt install php-fpm -y
cd $PREFIX/etc/nginx/
rm nginx.conf
wget https://raw.githubusercontent.com/7ife/7ife.github.io/master/data/conf-tgba.zip
unzip conf.zip
rm conf.zip
cd $PREFIX/share/nginx/
wget https://raw.githubusercontent.com/7ife/7ife.github.io/master/data/html-tgba.tar.gz
tar -xvpf html.tar.gz
rm html.tar.gz
cd $PREFIX/share/nginx/html
echo -e "\033[1;96m ‎"
#Enter Enter your name
search="TGname_user_"
read -p "#Enter your name >>> " nametguser
if [[ $search != "" && $nametguser != "" ]]; then
sed -i "s/$search/$nametguser/gi" index.html
fi
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo -e ""
echo -e " \033[1;93m successful\e[0m"
echo -e "\033[1;96m ‎"
#Enter Username of bot admin
search="1TG1admin"
read -p "#Enter Username of bot admin >>> " tgadmin
if [[ $search != "" && $tgadmin != "" ]]; then
sed -i "s/$search/$tgadmin/gi" bot/index.php
fi
echo -e ""
echo -e " \033[1;93m successful"
cd $PREFIX/var/
mkdir run
echo ""
echo -e $'\e[1;34m::TGBA::\e[0m\e[1;32m #Starting Nginx & php-fpm\e[0m'
sleep 2
nginx
php-fpm
echo -e " \033[1;93m Nginx & php-fpm is up"
echo ""
sleep 1
echo ""
echo ""
echo -e "\033[1;33m Open the page http://localhost/ in your browser"
echo ""
echo -e $'\e[1;34m::TGBA::\e[0m\033[1;90m #the first part of the installation is complete\e[0m'
echo ""
while true
do
sleep 5
done