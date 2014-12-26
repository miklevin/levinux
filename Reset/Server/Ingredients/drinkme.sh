clear
selection=
until [ "$selection" = "0" ]; do
echo -e "\e[1;33mVIM WILL SHOW YOU JUST HOW DEEP THE RABBIT HOLE GOES\e[00m"
echo "Congratulations! You just executed a shell script by typing its name. The dot-"
echo "slash before the filename meant to look for the file in your current directory."
echo "The filename was colored green because it was executable. Otherwise, you would"
echo -e "have had to type the command sh in front of it, like: \e[1;37msh ./drinkme.py\e[00m. The file"
echo "Recipe.sh was executed in this way to initially set up Levinux, and the other"
echo "file Pipulate.sh is what gets executed when you select Pipulate from the start"
echo "menu. The directory location you are in is known as home. Your username is tc"
echo "and so your current location is /home/tc which you see the contents of when"
echo -e "you type \e[1;37mls\e[00m. You can cd into folders like htdocs, and then step up out of them"
echo -e "by typing \e[1;37mcd ..\e[00m The dot-dot means go one directory level back up. Whenever you"
echo -e "want to get back home, you can type \e[1;37mcd ~/\e[00m The tilde-slash is a shortcut for"
echo -e "home, and is the same thing as typing \e[1;37mcd /home/tc\e[00m."
echo ""
echo "The next step is to build this into a full Python, vim and git code execution"
echo "and development platform. If you have not already done so, chose menu option #1"
echo -e "from the start menu, or type \e[1;37msh ./Pipulate.sh\e[00m after you're done here. We"
echo "also need to install vim, which is a very powerful text editor that will serve"
echo "you well for the rest of your life. The original version known as vi is actually"
echo "built standard into almost every Linux and Unix installation, so learning them"
echo "will let you work with text files on almost any system you ever encounter."
echo "Did I mention a rabbit hole? Well, everything in your adventures so far has"
echo "been quite easy in comparison to learning vim. But believe me, it is worth it."
echo ""
echo -en "\e[1;32mEnter \e[1;37m1\e[1;32m to Exit or \e[1;37m2\e[1;32m to install vim:\e[00m "
read selection
    case $selection in
        1 ) clear
            echo -e "You can get back to the menu with \e[1;37msh /etc/rc.local\e[00m"
            exit
            ;;
        2 ) clear
            echo -e "\e[1;31m                                             (\\"
            echo -e "        Installing:     _                     \x5c\x5c_ _/(\\          "
            echo -e "                 __   _(_)_ __ ___              0 0 _\\)___"
            echo -e "                 \ \ / / | '_ \` _ \           =(_T_)=     )*"
            echo -e "                  \ V /| | | | | | |_   _   _   /\"/   (  /"
            echo -e "                   \_/ |_|_| |_| |_(_) (_) (_) <_<_/-<__|      I'm sorry."
            echo -e "\e[00m"
            tce-load -wi vim > /dev/null
            rm /usr/local/share/vim/vim72/syntax/python.vim
            tftp -g -l /usr/local/share/vim/vim72/syntax/pytho.vim -r /Ingredients/python.vim 10.0.2.2
            sudo tr -d '\r' </usr/local/share/vim/vim72/syntax/pytho.vim >/usr/local/share/vim/vim72/syntax/python.vim
            sudo rm /usr/local/share/vim/vim72/syntax/pytho.vim
            tftp -g -l /usr/local/share/vim/vim72/colors/blackboar.vim -r /Ingredients/blackboard.vim 10.0.2.2
            sudo tr -d '\r' </usr/local/share/vim/vim72/colors/blackboar.vim >/usr/local/share/vim/vim72/colors/blackboard.vim
            sudo rm /usr/local/share/vim/vim72/colors/blackboar.vim
            tftp -g -l /home/tc/.vimrc -r /Ingredients/.vimrc 10.0.2.2
            echo "usr/local/share/vim/vim72/syntax/python.vim" >> /opt/.filetool.lst
            echo "usr/local/share/vim/vim72/colors/blackboard.vim" >> /opt/.filetool.lst
            sudo filetool.sh -b
            clear
            echo "vim installed. For the next chapter of Levinux, visit: http://levinux.com"
            exit
            ;;
    esac
done
exit 0
