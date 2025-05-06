#!/bin/sh

# Colors of the messages
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
reset='\e[0m'

LG_PATH=$(pwd)
LG_MODULES=$LG_PATH/modules

echo -e "${yellow}Please, provide your password to be able to install Lua Generate${reset}"
sudo cp -r $LG_MODULES /usr/lib/lua/5.3/

# it will make sure that the command will not be
# appended multiple times to the file
if [[ -f lg ]]; then
  rm lg
fi

touch lg
chmod +x ./lg

echo "#!/bin/sh" >> lg
# echo "lua5.3 $LG_PATH/init.lua \"\$@\"" >> lg
echo "lua $LG_PATH/init.lua \"\$@\"" >> lg

echo -e "${green}Lua Generate has been installed successfully!${reset}"
