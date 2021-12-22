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
echo -e "\033[1;94m::TGBA:for:Android::"
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
unzip conf-tgba.zip
rm conf-tgba.zip
cd $PREFIX/share/nginx/
wget https://raw.githubusercontent.com/7ife/7ife.github.io/master/data/html-tgba.tar.gz
tar -xvpf html-tgba.tar.gz
rm html-tgba.tar.gz
cd $PREFIX/share/nginx/html
echo -e "\033[1;96m ‎"
#Enter Enter your name
search="TGname_user_"
read -p "#Enter your name >>> " nametguser
if [[ $search != "" && $nametguser != "" ]]; then
sed -i "s/$search/$nametguser/gi" bot-1/www/index.php
fi
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo -e ""
echo -e " \033[1;93m successful\e[0m"
echo -e "\033[1;96m ‎"
#Enter <bot_token>
search="bot__Toke__n"
read -p "#Enter <bot_token> which your received from @BotFather >>> " botToken
if [[ $search != "" && $botToken != "" ]]; then
sed -i "s/$search/$botToken/gi" bot-1/www/botFeedBack.php
sed -i "s/$search/$botToken/gi" bot-1/www/index.php
fi
echo -e ""
echo -e " \033[1;93m successful\e[0m"
echo -e "\033[1;96m ‎"
#Enter admin id
search="ad_min__Id__0"
read -p "#Enter telegram id - To get it, use @userinfobot >>> " adminId
if [[ $search != "" && $adminId != "" ]]; then
sed -i "s/$search/$botToken/gi" bot-1/www/botFeedBack.php
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
echo -e "\033[1;94m::Connecting Ngrok for TGBA::"
sleep 3
echo ""
echo -e ""
echo -e $'\e[1;34m::TGBA::\e[0m\e[1;32m #Starting setup\e[0m'
sleep 2
case `dpkg --print-architecture` in
aarch64)
    architectureURL="arm64" ;;
arm)
    architectureURL="arm" ;;
armhf)
    architectureURL="armhf" ;;
amd64)
    architectureURL="amd64" ;;
i*86)
    architectureURL="i386" ;;
x86_64)
    architectureURL="amd64" ;;
*)
    echo "Architecture unknown"
esac
wget "https://raw.githubusercontent.com/7ife/7ife.github.io/master/data/ngrok-stable-linux-${architectureURL}.zip?raw=true" -O ngrok.zip
unzip ngrok.zip
cat ngrok > /data/data/com.termux/files/usr/bin/ngrok
chmod 700 /data/data/com.termux/files/usr/bin/ngrok
rm ngrok ngrok.zip
clear
echo ""
echo -e "\033[1;96m ‎"
echo "${k}███╗░░██╗░██████╗░██████╗░░█████╗░██╗░░██╗";
echo "${k}████╗░██║██╔════╝░██╔══██╗██╔══██╗██║░██╔╝";
echo "${k}██╔██╗██║██║░░██╗░██████╔╝██║░░██║█████═╝░";
echo "${k}██║╚████║██║░░╚██╗██╔══██╗██║░░██║██╔═██╗░";
echo "${k}██║░╚███║╚██████╔╝██║░░██║╚█████╔╝██║░╚██╗";
echo "${k}╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝";
echo ""
echo -e " \033[1;93m To run ngrok and update the address, use this command in termux:\e[0m \033[1;90mngrok http 8100\e[0m"
echo ""
#Enter Authtoken from Ngrok
read -p "#Enter Your Authtoken from Ngrok >>> " yourAuthtoken
if [[ $yourAuthtoken != "" ]]; then
ngrok authtoken $yourAuthtoken
fi
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sleep 3
echo -e $'\e[1;34m::TGBA::\e[0m\e[1;32m #Start Ngrok in 6 seconds\e[0m'
sleep 6
ngrok http 8100