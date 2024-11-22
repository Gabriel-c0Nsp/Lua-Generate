#!/bin/bash


echo "Copying lg module..."
sudo cp -r /home/consp/repos/lg-react/lg/modules /usr/lib/lua/5.3/ 

echo "Deleting lg module..."
sudo rm -rf /usr/lib/lua/5.3/modules/
