#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
    echo -ne "\n${redColour}[!]${endColour} ${grayColour}Exiting....\n${endColour}"
    tput cnorm
    echo -ne "${greenColour}\n Bye bye ...\n${endColour}"
    clear
    sleep 1.5;exit 0

}

function ending_banner(){

echo -ne "${redColour}╭╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭╮╱╱╱╱╱╱╱╭╮${endColour}\n"
echo -ne "${redColour}┃┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃┃╱╱╱╱╱╱╱┃┃${endColour}\n"
echo -ne "${redColour}┃╰━┳━━┳━━┳━━┳╮╱╭╮┃╰━┳━━┳━━┫┃╭┳┳━╮╭━━╮${endColour}\n"
echo -ne "${redColour}┃╭╮┃╭╮┃╭╮┃╭╮┃┃╱┃┃┃╭╮┃╭╮┃╭━┫╰╯╋┫╭╮┫╭╮┃${endColour}\n"
echo -ne "${redColour}┃┃┃┃╭╮┃╰╯┃╰╯┃╰━╯┃┃┃┃┃╭╮┃╰━┫╭╮┫┃┃┃┃╰╯┃${endColour}\n"
echo -ne "${redColour}╰╯╰┻╯╰┫╭━┫╭━┻━╮╭╯╰╯╰┻╯╰┻━━┻╯╰┻┻╯╰┻━╮┃${endColour}\n"
echo -ne "${redColour}╱╱╱╱╱╱┃┃╱┃┃╱╭━╯┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┃${endColour}\n"
echo -ne "${redColour}╱╱╱╱╱╱╰╯╱╰╯╱╰━━╯╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰━━╯ - by J4ckris ;} ${endColour}\n"

}
function dependencies(){

    # checking dependencies
    dependencies=(go git)

    echo -ne "${purpleColour}[*] ${endColour}${blueColour}Checking dependencies${endColour}\n"

    sleep 2

    for program in "${dependencies[@]}"; do
        echo -ne "${grayColour}\n[*] $program ${endColour}"
        test -f /usr/bin/$program

        if [ "$(echo $?)" == "0" ];then

            echo -e " ${greenColour}(Installed)${endColour}"
        else

            echo -e "\n[*] Installing $program\n"
            apt-get install $program -y > /dev/null 2>&1


        fi;sleep 1

    done
    clear

}
function quickinstall(){
    clear

    quick_install_programs=(assetfinder subfinder amass dirsearch feroxbuster gobuster ffuf nmap aws dnstwist burpsuite)

    echo -ne "${purpleColour}[*] ${endColour}${blueColour}Installing tools....${endColour}\n"

    sleep 1

    for quick_install_program in "${quick_install_programs[@]}"; do

        echo -ne "${grayColour}\n[*] $quick_install_program ${endColour}"

        test -f /usr/bin/$quick_install_program

        if [ "$(echo $?)" == "0" ];then

            echo -e " ${greenColour}(Installed)${endColour}"

        else

            echo -e "\n${grayColour}[*] Installing $quick_install_program....${endColour}\n"

            apt-get install $quick_install_program -y > /dev/null 2>&1



        fi;sleep 1

    done
    clear

}

if [ $(id -u) -eq "0" ];then

    dependencies
    quickinstall
    ending_banner

else

    echo -ne "\n${redColour}[!]${endColour} ${grayColour}You need to be root to execute this program :(${endColour}\n"
    exit 1

fi


