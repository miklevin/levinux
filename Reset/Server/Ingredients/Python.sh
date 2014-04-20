echo -e "\e[00;36m"
echo "-------------------------------------------------------------------------------"
echo " ____        _   _                          _              ___           _ _   "
echo "|  _ \ _   _| |_| |__   ___  _ __    __   _(_)_ __ ___    ( _ )     __ _(_) |_ "
echo "| |_) | | | | __| '_ \ / _ \| '_ \   \ \ / / | '_ \` _ \   / _ \/\  / _\` | | __|"
echo "|  __/| |_| | |_| | | | (_) | | | |_  \ V /| | | | | | | | (_>  < | (_| | | |_ "
echo "|_|    \__, |\__|_| |_|\___/|_| |_( )  \_/ |_|_| |_| |_|  \___/\/  \__, |_|\__|"
echo "       |___/                      |/                               |___/       "
echo ""
echo " It will take a short while to fetch Python, vim, git and their dependencies."
echo " They are a language, text editor and revision control system, respectively."
echo " This is precisely enough to write, execute, and preserve your code for life."
echo " It's a 1-time process. You will NOT need to do it every time you run Levinux."
echo -e " If you install anything with pip, run \"\e[1;31mfiletool.sh -b\e[00;36m\" to make it persistent."
echo "-------------------------------------------------------------------------------"
echo -e "\e[1;37m"

# everything necessary to make it a development platform
tce-load -wi python > /dev/null
tce-load -wi python-distribute > /dev/null
tce-load -wi curl > /dev/null
tce-load -wi expat2 > /dev/null
tce-load -wi git > /dev/null
tce-load -wi Xlibs > /dev/null
tce-load -wi vim > /dev/null
rm /usr/local/share/vim/vim72/syntax/python.vim
tftp -g -l /usr/local/share/vim/vim72/syntax/python.vim -r /Ingredients/python.vim 10.0.2.2
tftp -g -l /usr/local/share/vim/vim72/colors/blackboard.vim -r /Ingredients/blackboard.vim 10.0.2.2
tftp -g -l /usr/local/share/vim/vim72/colors/blackboard.vim -r /Ingredients/blackboard.vim 10.0.2.2
tftp -g -l /home/tc/.vimrc -r /Ingredients/.vimrc 10.0.2.2

mkdir /home/tc/pydocs
tftp -g -l /home/tc/pydocs/bottle.py -r /Ingredients/bottle.py 10.0.2.2
tftp -g -l /home/tc/pydocs/webapp.py -r /Ingredients/webapp.py 10.0.2.2
tftp -g -l /home/tc/pydocs/favicon.ico -r /Ingredients/favicon.ico 10.0.2.2

echo "Final stage: installing pip, requests & running backup. Ignore warnings."
sudo easy_install pip > /dev/null
sudo pip install requests > /dev/null

echo "usr/local/share/vim/vim72/syntax/python.vim" >> /opt/.filetool.lst
echo "usr/local/share/vim/vim72/colors/blackboard.vim" >> /opt/.filetool.lst
echo "usr/local/bin/pip" >> /opt/.filetool.lst
echo "usr/local/bin/pip-2.7" >> /opt/.filetool.lst
echo "usr/local/lib/python2.7/site-packages/" >> /opt/.filetool.lst

filetool.sh -b
exit

