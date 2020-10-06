#!/bin/sh

set -e
echo "####"
echo "##"
echo "## Boseji's Pacman Secure Configuration Script"
echo "##"
echo "## SPDX-License-Identifier: GPL-2.0-only"
echo "##"
echo "## Copyright (C) 2020 Abhijit Bose <boseji@users.noreply.github.com>"
echo "##"
echo "####"
echo
echo " => Enabling HTTPS for Pacman!"
echo
echo " Press Enter to Apply... (will need sudo)"
read
sudo sed -i 's/# Protocols =/Protocols = https/g' /etc/pacman-mirrors.conf
echo
echo " => Enabling SSL Verify for Pacman!"
echo
echo " Press Enter to Apply... (will need sudo)"
read
sudo sed -i 's/# SSLVerify/SSLVerify/g' /etc/pacman-mirrors.conf
echo
echo " => Updating Pacman mirrors form United States and Japan"
echo
echo " Press Enter to Apply... (will need sudo)"
read
sudo pacman-mirrors --timeout 5 --country United_States Japan
echo
echo " => Full System Upgrade with Pacman "
echo
echo " Press Enter to Apply... (will need sudo)"
read
sudo pacman -Syyu
echo

