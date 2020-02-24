#!/bin/bash
sudo rm -rf build r_type
echo -e "\033[32mBuilding the project...\033[0m"
mkdir build && cd build && conan install .. --build=missing  && cmake .. -G "Unix Makefiles" && cmake --build .
cp ./bin/r_type ../
cp ./bin/gameserver ../
rm build.log
cd ..
echo -e "\033[32mDone\033[0m"
echo -e "\033[32mLaunching app...\033[0m"
./r_type
#./gameserver
echo -e "\033[32mApp close.\033[0m"