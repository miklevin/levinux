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
echo ""
echo "-------------------------------------------------------------------------------"

# everything necessary to make it a development platform
echo -e "\e[1;37mInstalling Python...\e[0;37m"
tce-load -wi python > /dev/null
tce-load -wi python-distribute > /dev/null
echo -e "\e[1;37mInstalling git...\e[0;37m"
tce-load -wi git > /dev/null
echo -e "\e[1;37mInstalling Flask...\e[0;37m"
sudo easy_install flask > /dev/null 2>&1
sudo easy_install flask_wtf > /dev/null 2>&1
echo -e "\e[1;37mInstalling GSpread...\e[0;37m"
sudo easy_install gspread > /dev/null 2>&1
cd /home/tc/
echo -e "\e[1;37mCloning Pipulate from Github...\e[0;37m"
echo "clone https://github.com/miklevin/pipulate.git..."
git clone https://github.com/miklevin/pipulate.git > /dev/null

# Back up things installed with Python-distribute easy_install
echo "usr/local/lib/python2.7/site-packages/" >> /opt/.filetool.lst
# head -n -1 /opt/bootsync.sh > /opt/bootlocal.sh
# sudo rm /opt/bootlocal.sh
# sudo mv /opt/bootlocal.sh /opt/bootlocal.sh
# sudo chmod a+x /opt/bootlocal.sh
cd /home/tc/pipulate/
nohup python pipulate.py > /dev/null &
echo -e "cd /home/tc/pipulate/\nnohup python pipulate.py > /dev/null &\nsh /etc/rc.local" >> /opt/bootlocal.sh
filetool.sh -b >> /dev/null
exit

