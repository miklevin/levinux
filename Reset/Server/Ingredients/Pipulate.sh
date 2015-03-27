clear
selection=
until [ "$selection" = "0" ]; do
echo -e "\e[1;33mTHIS INSTALLS A BUNCH OF STUFF AND TAKES AWHILE\e[00m"
echo "After this is done, a website will become active on http://localhost:8888"
echo "but if you proceed, it could take up to 10 minutes to built the server."
echo ""
echo -en "\e[1;32mEnter \e[1;37m1\e[1;32m to Exit or \e[1;37m2\e[1;32m to install Pipulate:\e[00m "
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
            echo "      Please have patience while Pipulate is installed, along with its"
            echo -e "          dependencies. When complete, visit \e[00mhttp://localhost:\e[1;37m8888\e[1;34m"
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
            echo -e "\e[1;37mInstalling Requests (and all its dependencies)...\e[0;37m"
            sudo easy_install requests 2> /dev/null
            echo -e "\e[1;37mInstalling GSpread...\e[0;37m"
            sudo easy_install gspread 2> /dev/null
            cd /home/tc/
            echo -e "\e[1;37mCloning Pipulate from Github...\e[0;37m"
            echo "clone https://github.com/miklevin/pipulate.git..."
            git clone https://github.com/miklevin/pipulate.git

            # Back up things installed with Python-distribute easy_install
            echo "usr/local/lib/python2.7/site-packages/" >> /opt/.filetool.lst
            mkdir /home/tc/uploads
            cd /home/tc/pipulate/
            nohup python webpipulate.py > /dev/null &
            echo $! > pid.txt
            echo -e "cd /home/tc/pipulate/\ngit pull -q\nsudo nohup python webpipulate.py > /dev/null\necho \$! > pid.txt &" >> /opt/bootlocal.sh
            echo -e "\e[1;37mMaking Python extensions persistent...\e[0;37m"
            sudo filetool.sh -b
            exit
            ;;
    esac
done
exit 0
