#!/bin/bash

echo "-[ Django & Python3 quick setup script ]-"
echo "Quickly install python3, django, virtualenv and start a new django project."
echo "    Tested on Ubuntu 18.04.2  "
echo "  "

check_install(){
      echo "[!] Updating os"
      sudo apt update -y
      sudo apt upgrade -y
      echo ""
      echo ""
      echo "[!] Installing python3 && venv"
      sudo apt install -y python3 python3-pip
      pip3 install virtualenv
      echo ""
      echo "[-] Creating virtualenv"
      mkdir venv
      python3 -m virtualenv venv
      echo "[-] Entering virtualenv"
      source venv/bin/activate
      echo ""
      echo "[!] Installing Django"
      pip install django
}

if [ $# -eq 0 ]
  then
    echo "Usage: django-quick-setup.sh <Project directory> <Project-Name>"
fi
if [ $# -eq 1 ]
  then
    echo "Usage: django-quick-setup.sh <Project directory> <Project-Name>"
fi
if [ $# -ge 3 ]
  then
    echo "Usage: django-quick-setup.sh <project directory> <Project-Name>"
fi

if [ $# -eq 2 ]
  then
    cd $1
    mkdir $2
    cd $2
    echo "[!] Making sure we have eveything installed and set up."
    check_install
    project_name=$2
    echo ""
    echo "[+] Creating project: $project_name"
    django-admin startproject $project_name
    echo ""
    echo "[+] DONE! "
    echo "Go forth and code ye heart out."

fi
