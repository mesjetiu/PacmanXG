#!/bin/bash
echo "================== Whoami =================="
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root"
   exit 1
  else echo "You are root. Good. Continue ..."
fi 
echo "================== make /opt/pacmanxg =================="
mkdir /opt/pacmanxg
if ! [[ -d "/opt/pacmanxg" &&  -w "/opt/pacmanxg" ]]; then
  echo "::=> Directory does not exist : /opt/pacmanxg"
  exit 1
  else echo "Directory exists"
fi
echo "================== make /opt/pacmanxg/langs =================="
mkdir /opt/pacmanxg/langs
if ! [[ -d "/opt/pacmanxg/langs" &&  -w "/opt/pacmanxg/langs" ]]; then
  echo "::=> Directory does not exist : /opt/pacmanxg/langs"
  exit 1
  else echo "Directory exists"
fi

cp ./langs/* /opt/pacmanxg/langs
cp ./* /opt/pacmanxg
cp ./pacmanxg.desktop /usr/share/applications/pacmanxg.desktop
cp ./icon.png /usr/share/pixmaps/pacmanxg.png
chmod 644 /usr/share/pixmaps/pacmanxg.png
chmod 644 /opt/pacmanxg/*
chmod 755 /opt/pacmanxg/langs
chmod 644 /opt/pacmanxg/langs/*
chmod 755 /opt/pacmanxg/dizz.sh
chmod 755 /opt/pacmanxg/ssx
chmod 755 /opt/pacmanxg/pacmanxg
echo "================== Done =================="
