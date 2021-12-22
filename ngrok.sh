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
sleep 3
echo -e $'\e[1;34m::TGBA::\e[0m\e[1;32m #Start in 6 seconds\e[0m'
sleep 6
ngrok http 8000