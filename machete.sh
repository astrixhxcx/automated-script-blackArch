#***************************************************************************#
# machete automated blackArch Linux Upgrade  ver 1.6                        *
# Author : Developer --Bruno A. Diaz                                        *
#                :~-===[$ " Astrix " ]===-                                  *
# Blackhat : Arsenal Edition                                                *
# OS: BlackArch Linux  GNU/Linux                                            *
#***************************************************************************#

#!/bin/bash

# Colors
RED='\033[0;31m'
GREE='\033[0;32m'
BLUE='\033[0;34m'
echo -e "${BLUE}*---===[ ${RED}blackArch Linux ${BLUE}]===---*"

# Colors
BLUE='033\[0;36m'
echo -e "${BLUE} @@@@@@@@@@   @@@@@@  @@@@@@@  @@@   @@@  @@@@@@@ @@@@@@@ @@@@@@@  "
echo -e "${BLUE} @@! @@! @@! @@!  @@@ !@@      !@@   @@@  @@!       @!!   @@!      "
echo -e "${BLUE} @!! !!@ @!@ @!@  @@! !@!      !@@   !@@  @@!       @!!   @@!      "
echo -e "${BLUE} @!! !!@ @!@ @!@!@!@! !@!      @!@!@!@!@! @!!!!:!   !!:   @!!!!:!  "
echo -e "${BLUE} !!:     !!: !!:  !!! :!!      !!:    !!! !!:       !!:   !!:      "
echo -e "${BLUE}  :       :  !!:  !!! :!!      !!:    !!! !!:        :    !!:      "
echo -e "${BLUE}  :       :   :    :   :: :: :  :      :  : :: ::    :    : :: ::  "

CYAN='033\[0;36m'
echo -e "${CYAN}  @@@@@   @@@@@@ @@@@@@@ @@@@@@@  @@@ @@@   @@@  "
echo -e "${CYAN} @@  @@@ !@@       @!!   @@!  @@@ @@! @@!   !@@  "
echo -e "${CYAN} @@! @@@ !@@       @!!   @@!  @@@ @@!  !@@!@!    "
echo -e "${CYAN} @!@!@!@! !@@!!    !!:   @!@!!@!  !!@   !::!!    "
echo -e "${CYAN} !!:  !!!    !:!   !!:   !!: :!!  !!:   !: :!!   "
echo -e "${CYAN}  :   !!!     :     :    !!: :!!  !!:  :::  :::  "
echo -e "${CYAN}  :   : :::.: :     :     :    :: :   :::    ::: "


# Verificacion root

check_exit_status() {

if [ $? -q 0 ]
then
  echo ========================
  echo " Successful Result "
  echo ========================
else
  echo ============================
  echo " [Error] Process Failed! "
  echo ============================
  read -p " Then Last Command Exited With an Error. Exit script (yes/no) " answer
  if [ " $answer " == "yes" ]
  then
    exit 1
  fi
fi

}

greeting() {
  echo ===============================================
  echo " Hello, $USER. Let's rock Upgrade System. "
  echo ===============================================

}

echo ================
echo " Check root "
echo ================

if [[ $UID == 0 ]]; then
  echo " Please run this script WITHOUT sudo: "
  echo " $0 $* "
  exit 1

fi

 echo ====================================================
 echo " pacman -Syyu --needed --overwrite '*' blackarch "
 echo ====================================================

 echo ================
 echo " Orphans "
 echo ================

 pkgorphans=$(sudo pacman -Qdt)

 if [ -z " $pkgorphans " ]
 then
   echo No pkgorphans
 else
   echo ===================
   echo " Remove Orphans "
   echo ===================
   sudo pacman -Rsn $(sudo pacman -Qtdq)

 fi

 echo ==========================================
 read -e -p " Upgrade Aur Pkg? " -i "Y" REPLY
 echo ==========================================
 if [[ $REPLY =~ ^[Yy]$ ]]
 then

   # sudo echo " SUDO HACK "
   user=${whoami}
   echo " Change user to '\$(whoami)' "
   yaourt -Syua

 fi

 leave() {

   echo ============================================
   echo " *************************************** "
   echo " ---===[ " Upgrade Complete " ]===--- "
   echo " *************************************** "
   echo ===========================================
   exit

 }

