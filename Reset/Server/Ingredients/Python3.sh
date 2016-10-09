clear
selection=
until [ "$selection" = "0" ]; do
echo -e "\e[1;33mTHIS INSTALLS A BUNCH OF STUFF AND TAKES AWHILE\e[00m"
echo "This is the levinux/Reset/Server/Ingredients/Python3.sh script executing."
echo "It's basically just a bunch of Tiny Core Linux repository install commands."
echo "You can put together your own spins by editing Recipe.sh and Python3.sh."
echo "I put it together as a bare minimum code development and execution platform"
echo "but it could be used to create pretty much anything. Further instructions"
echo "can be found at http://localhost:8080 in your web browser."
echo ""
echo -en "\e[1;32mEnter \e[1;37m1\e[1;32m to Exit or \e[1;37m2\e[1;32m to install Python 3:\e[00m "
read selection
    case $selection in
        1 ) clear
            exit
            ;;
        2 ) clear
            echo -e "\e[1;34m"
            echo "------------------------------------------------------------------------------"
            echo "         ____        _   _                     ___             _ _   "
            echo "        |  _ \ _   _| |_| |__   ___  _ __     ( _ )       __ _(_) |_ "
            echo "        | |_) | | | | __| '_ \ / _ \| '_ \    / _ \/\    / _\` | | __|"
            echo "        |  __/| |_| | |_| | | | (_) | | | |  | (_>  <   | (_| | | |_ "
            echo "        |_|    \__, |\__|_| |_|\___/|_| |_|   \___/\/    \__, |_|\__|"
            echo "               |___/                                     |___/       "
            echo ""
            echo "          Please have patience while Python 3 and git are installed."
            echo "------------------------------------------------------------------------------"
            echo ""
            if [ -e /tmp/firstboot.txt ]; then
              sudo rm /tmp/firstboot.txt > /dev/null
            fi
            # everything necessary to make it a development platform
            echo -e "\e[1;37mInstalling Python (and all its many, many dependencies)...\e[0;37m"
            # tce-load -wi python > /dev/null
            tce-load -wi python3.5-dev
            echo -e "\e[1;37mGetting & installing the old Python Setuptools...\e[0;37m"
            cd /home/tc/
            wget https://bootstrap.pypa.io/ez_setup.py
            echo "Have patience, stuff is happening..."
            sudo python3 ez_setup.py > /dev/null 2>&1
            echo -e "\e[1;37mUsing Setuptools to install the more popular & modern pip...\e[0;37m"
            echo "Again, have patience, stuff is happening..."
            sudo easy_install pip > /dev/null 2>&1
            echo -e "\e[1;37mInstalling git (and all its dependencies)...\e[0;37m"
            tce-load -wi git
            echo "usr/local/lib/python3.4/site-packages/" >> /opt/.filetool.lst
            echo -e "\e[1;37mMaking Python extensions persistent...\e[0;37m"
            sudo filetool.sh -b
            exit
            ;;
    esac
done
exit 0
