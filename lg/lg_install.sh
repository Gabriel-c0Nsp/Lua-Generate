#!/bin/sh

LG_PATH=$(pwd)
LG_MODULES=$LG_PATH/modules

sudo cp -r $LG_MODULES /usr/lib/lua/5.3/

# it will make sure that the command will not be
# appended multiple times to the file
rm lg
touch lg
chmod +x ./lg

echo "#!/bin/sh" >> lg
echo "lua5.3 $LG_PATH/init.lua \"\$@\"" >> lg
