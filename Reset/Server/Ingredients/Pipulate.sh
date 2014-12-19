echo -e "\e[1;34m"
echo "------------------------------------------------------------------------------"
echo "         ____        _   _                     ___             _ _   "
echo "        |  _ \ _   _| |_| |__   ___  _ __     ( _ )       __ _(_) |_ "
echo "        | |_) | | | | __| '_ \ / _ \| '_ \    / _ \/\    / _\` | | __|"
echo "        |  __/| |_| | |_| | | | (_) | | | |  | (_>  <   | (_| | | |_ "
echo "        |_|    \__, |\__|_| |_|\___/|_| |_|   \___/\/    \__, |_|\__|"
echo "               |___/                                     |___/       "
echo ""
echo "      Please have patience while Pipulate is installed, along with its"
echo "          dependencies. When complete, visit http://localhost:8888"
echo "------------------------------------------------------------------------------"
echo ""
if [ -e /tmp/firstboot.txt ]; then
	sudo rm /tmp/firstboot.txt > /dev/null
fi
# everything necessary to make it a development platform
echo -e "\e[1;37mInstalling Python (and all its dependencies)...\e[0;37m"
tce-load -wi python > /dev/null
tce-load -wi python-distribute > /dev/null
echo -e "\e[1;37mInstalling git (and all its dependencies)...\e[0;37m"
tce-load -wi git > /dev/null
echo -e "\e[1;37mInstalling Flask (and all its dependencies)...\e[0;37m"
sudo easy_install flask 2> /dev/null
sudo easy_install flask_wtf 2> /dev/null
echo -e "\e[1;37mInstalling GSpread...\e[0;37m"
sudo easy_install gspread 2> /dev/null
cd /home/tc/
echo -e "\e[1;37mCloning Pipulate from Github...\e[0;37m"
echo "clone https://github.com/miklevin/pipulate.git..."
git clone https://github.com/miklevin/pipulate.git

# Back up things installed with Python-distribute easy_install
echo "usr/local/lib/python2.7/site-packages/" >> /opt/.filetool.lst
cd /home/tc/pipulate/
nohup python pipulate.py > /dev/null &
echo -e "cd /home/tc/pipulate/\nsudo nohup python pipulate.py > /dev/null &" >> /opt/bootlocal.sh
echo -e "\e[1;37mMaking Python extensions (Flask, GSpread) persistent...\e[0;37m"
filetool.sh -b
exit

