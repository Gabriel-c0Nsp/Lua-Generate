#!/bin/sh


#####################################################################
#                                                                   #
# lg_install.sh - Installation script of the program Lua Generate   #
#                                                                   #
# Author: Gabriel Silva Aires                                       #
# GitHub: https://github.com/Gabriel-c0Nsp                          #
#                                                                   #
# Domain: https://github.com/Gabriel-c0Nsp/Lua-Generate             #
#                                                                   #
#####################################################################


# Colors of the messages
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
reset='\e[0m'

LG_PATH=$(pwd)
LG_MODULES=$LG_PATH/modules

# check if the user has the right version of lua
lua5.3 -v &> /dev/null

if test $? != 0; then
  echo -e "${red}You need to install lua 5.3 to use Lua Generate${reset}"
  echo -e "See ${blue}https://github.com/Gabriel-c0Nsp/Lua-Generate${reset} for more information."
  exit 1
fi

# the user can already have a lg file (Lua Generate program or something else)
if test -f lg; then
  echo -e "${yellow}You already have Lua Generate installed on your machine${reset}"

  choice=""

  echo -n "Would you like to update it (or install it again)? [y/N]: "

  read choice

  if [[ $choice != "y" && $choice != "yes" ]]; then
    exit 0
  fi
fi

echo -e "${yellow}You may have to provide your password to be able to install Lua Generate${reset}"
sudo cp -r $LG_MODULES /usr/lib/lua/5.3/

echo -e "Installing...\n"

touch lg
chmod +x ./lg

# "installation" process
echo "#!/bin/sh" > lg
echo "lua5.3 $LG_PATH/init.lua \"\$@\"" >> lg

echo -e "${green}Lua Generate has been installed successfully!${reset}"
echo "You can try: lg --help for more information"
