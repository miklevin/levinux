touch /tmp/firstboot.txt

echo -e "\e[00;36m"
echo "-------------------------------------------------------------------------------"
echo "                    _                 _"
echo "                   | |     _____   __(_)_ __  _   ___  __"
echo "                   | |    / _ \ \ / /| | '_ \| | | \ \/ /"
echo "                   | |___|  __/\ V / | | | | | |_| |>  <"
echo "                   |_____|\___| \_/  |_|_| |_|\__,_/_/\_\\"
echo ""
echo "                              Beta Version 3.0" 
echo "            A Portable Linux Server and Programming Environment"
echo -e "               Built on \e[1;37mTiny Core Linux\e[00;36m and \e[1;37mQEMU\e[00;36m PC Emulator"
echo "                 Master the short-stack: Python, vim & git"
echo -e "\e[1;37m"
echo " A one-time \"Recipe\" is being run to provide SSH login and a small webserver."
echo "          Please be patient while your server finishes cooking..."
echo -e "                \e[1;33mCtrl+S\e[1;37m freezes boot and \e[1;33mCtrl+Q\e[1;37m continues" 
echo -e "\e[00;36m-------------------------------------------------------------------------------\e[00m"
echo ""

#Set up an ssh and sftp server (allows you to get in from the host machine)

# sudo -u tc tce-load -wi dropbear > /dev/null
# sudo -u tc tce-load -wi busybox-httpd > /dev/null

# Alternative to tce-load to install ssh and httpd without online connection.
tftp -g -l /mnt/sdc1/tce/optional/dropbear.tcz -r /Ingredients/dropbear.tcz 10.0.2.2
tftp -g -l /mnt/sdc1/tce/optional/dropbear.tcz.md5.txt -r /Ingredients/dropbear.tcz.md5.txt 10.0.2.2
tftp -g -l /mnt/sdc1/tce/optional/busybox-httpd.tcz -r /Ingredients/busybox-httpd.tcz 10.0.2.2
tftp -g -l /mnt/sdc1/tce/optional/busybox-httpd.tcz.md5.txt -r /Ingredients/busybox-httpd.tcz.md5.txt 10.0.2.2
echo -e "dropbear.tcz\nbusybox-httpd.tcz" >> /mnt/sdc1/tce/onboot.lst
sudo -u tc tce-load -i dropbear > /dev/null
sudo -u tc tce-load -i busybox-httpd > /dev/null

mkdir /home/tc/htdocs
tftp -g -l /home/tc/htdocs/index.html -r /Ingredients/index.html 10.0.2.2
sudo chown tc /home/tc/htdocs/index.html
tftp -g -l /home/tc/htdocs/style.css -r /Ingredients/style.css 10.0.2.2
tftp -g -l /home/tc/htdocs/favicon.ico -r /Ingredients/favicon.ico 10.0.2.2
tftp -g -l /home/tc/Pipulate.sh -r /Ingredients/Pipulate.sh 10.0.2.2
sudo sed -i 's/\r//' /home/tc/Pipulate.sh
tftp -g -l /home/tc/drinkme.sh -r /Ingredients/drinkme.sh 10.0.2.2
sudo sed -i 's/\r//' /home/tc/drinkme.sh
sudo chown tc /home/tc/drinkme.sh
sudo chmod a+x /home/tc/drinkme.sh
tftp -g -l /etc/dropbear/dropbear_dss_host_key -r /Ingredients/dropbear_dss_host_key 10.0.2.2
tftp -g -l /etc/dropbear/dropbear_rsa_host_key -r /Ingredients/dropbear_rsa_host_key 10.0.2.2
tftp -g -l /etc/rc.local -r /Ingredients/rc.local 10.0.2.2
sudo sed -i 's/\r//' /etc/rc.local
echo -e "etc/rc.local\netc/init.d/dropbear\netc/dropbear\nusr/bin/dbclient\nusr/bin/dropbear\nusr/bin/dropbearconvert\nusr/bin/dropbearkey\nusr/bin/scp\nusr/bin/ssh\nusr/sbin/dropbearmulti" >> /opt/.filetool.lst

# Grab additional files for easy customized builds
mkdir /home/tc/.extras
tftp -g -l /home/tc/.extras/extras.lst -r /Ingredients/extras.lst 10.0.2.2
tftp -g -l /home/tc/.extras/install_extras.sh -r /Ingredients/install_extras.sh 10.0.2.2
chmod +x /home/tc/.extras/install_extras.sh
sudo /home/tc/.extras/install_extras.sh

cd /tmp
echo "/etc/init.d/dropbear start > /dev/null" >> /opt/bootlocal.sh
echo "/usr/local/httpd/sbin/httpd -p 80 -h /home/tc/htdocs -u tc:staff" >> /opt/bootlocal.sh
echo "export GIT_SSL_NO_VERIFY=true" >> /home/tc/.ashrc
echo "sh /etc/rc.local" >> /opt/bootsync.sh
cd /home/tc

#Set up a password for tc user (necessary for sftp and other remote tools)
echo -e "foo\nfoo" | passwd tc > /dev/null
echo -e "etc/passwd\netc/shadow" >> /opt/.filetool.lst

if [ -e ~/.ash_history ]; then
  rm ~/.ash_history
fi

filetool.sh -b

echo -e "echo \"\e[1;33mI'm trying to free your mind, but I can only show you the door.\e[00m You have walked\"" >> /home/tc/.profile
echo -e "echo \"through by logging into a \e[1;31mTerminal\e[00m, but now, you must experiment. Get back the\"" >> /home/tc/.profile
echo -e "echo \"menu with \e[1;37msh /etc/rc.local\e[00m. Go google the \e[1;37mls\e[00m and \e[1;37mcd\e[00m commands. Also, you may get\"" >> /home/tc/.profile
echo -e "echo \"privileged root access by typing \e[1;37msudo su\e[00m, and come back here by typing \e[1;37mexit\e[00m or\"" >> /home/tc/.profile
echo -e "echo \"or shut down the VM by typing \e[1;37mpoweroff\e[00m while root. You can't imagine the lengths\"" >> /home/tc/.profile
echo -e "echo \"admins used to go to in order to keep the keys to the kingdom out of your hands.\"" >> /home/tc/.profile
echo -e "echo \"When you are ready, type \e[1;37mls\e[00m and hit Enter. Then, type \e[1;32m./drinkme.sh\e[00m\"" >> /home/tc/.profile
echo -e "echo \"\n\"" >> /home/tc/.profile


