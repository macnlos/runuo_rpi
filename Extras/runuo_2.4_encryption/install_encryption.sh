#!/bin/bash

# This script simply copies the code from this folder to your RunUO Scripts directory.

echo "Copying Script files"
cp -r Scripts/* ../../Scripts

echo
echo "That's it.  Start your server and you should be able to connect with an Encrypted client."
