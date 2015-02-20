#!/bin/bash

# This script simply copies the code from this folder to your RunUO Scripts directory.

echo "Copying Data files"
cp -r runuo_2.4_code/Data/* ../../Data

echo "Copying Script files"
cp -r runuo_2.4_code/Scripts/* ../../Scripts

echo
echo "That's it.  Start your server and with your admin account you should be able to see the PremiumSpawner."
