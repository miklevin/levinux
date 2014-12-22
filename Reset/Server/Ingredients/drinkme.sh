clear
selection=
until [ "$selection" = "0" ]; do
echo "VIM WILL HOW DEEP THIS RABBIT HOLE GOES"
echo "Congratulations! You just executed a shell script by typing its name. The dot"
echo "slash before the filename meant to look for the file in your current directory."
echo "The filename was colored green because it was executable. Otherwise, you would"
echo "have had to type the command sh in front of it, like: sh drinkme.py. The file"
echo "Recipe.sh was executed in this way to initially set up Levinux, and the other"
echo "file Pipulate.sh is what gets executed when you select Pipulate from the start"
echo "menu. The directory location you are in is known as home. Your username is tc"
echo "and so your current location is /home/tc which you see the contents of when"
echo "you type ls. You can cd into folders like htdocs, and then step up out of them"
echo "by typing cd.. The dot dot means go one directory level back up. Whenever you"
echo "want to get back home, you can type cd ~/ The tilde-slash is a shortcut for"
echo "home, and is the same thing as typing cd /home/tc."
echo ""
echo "The next step is to build this into a full Python, vim and git code execution"
echo "and development platform. If you have not already done so, chose menu option #1"
echo "from the start menu, or type sh ./Pipulate.sh after you're done reading this."
echo "We also need to install vim, which is a very powerful text editor that will"
echo "serve you well for the rest of your life. The original version known as vi is"
echo "actually built into almost every Linux amd Unix installation, so learning them"
echo "will let you work with text files on almost any system you ever encounter."
echo "Did I mention a rabbit hole? Well, everything in your adventures so far has"
echo "been quite easy in comparison to learning vim. But believe me, it is worth it."
echo ""
echo -n "Enter 1 to Exit or 2 to install vim: "
read selection
    case $selection in
        1 ) clear
            exit
            ;;
        2 ) clear
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
            exit
            ;;
    esac
done
exit 0
