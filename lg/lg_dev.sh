#!/bin/bash

echo "whant to copy or delete lg module?"
echo "1. copy"
echo "2. delete"

read -p "Enter your choice: " choice

if [ $choice -eq 1 ]
then
    echo "Copying lg module..."
    sudo cp -r /home/consp/repos/lg-react/lg/modules /usr/lib/lua/5.3/ 
else
    echo "Deleting lg module..."
    sudo rm -rf /usr/lib/lua/5.3/modules/
fi
