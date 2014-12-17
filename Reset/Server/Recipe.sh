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
echo -e "\e[00;36m-------------------------------------------------------------------------------\e[00m"
echo ""

#Set up an ssh and sftp server (allows you to get in from the host machine)
sudo -u tc tce-load -wi dropbear > /dev/null
sudo -u tc tce-load -wi busybox-httpd > /dev/null
mkdir /home/tc/htdocs

tftp -g -l /home/tc/htdocs/index.html -r /Ingredients/index.html 10.0.2.2
tftp -g -l /home/tc/htdocs/style.css -r /Ingredients/style.css 10.0.2.2
tftp -g -l /home/tc/htdocs/favicon.ico -r /Ingredients/favicon.ico 10.0.2.2
tftp -g -l /home/tc/Pipulat.sh -r /Ingredients/Pipulate.sh 10.0.2.2
sudo tr -d '\r' </home/tc/Pipulat.sh >/home/tc/Pipulate.sh
sudo rm /home/tc/Pipulat.sh
tftp -g -l /etc/dropbear/dropbear_dss_host_key -r /Ingredients/dropbear_dss_host_key 10.0.2.2
tftp -g -l /etc/dropbear/dropbear_rsa_host_key -r /Ingredients/dropbear_rsa_host_key 10.0.2.2
tftp -g -l /etc/rc.loca -r /Ingredients/rc.local 10.0.2.2
sudo tr -d '\r' </etc/rc.loca >/etc/rc.local
sudo rm /etc/rc.loca
echo -e "etc/rc.local\netc/init.d/dropbear\netc/dropbear\nusr/bin/dbclient\nusr/bin/dropbear\nusr/bin/dropbearconvert\nusr/bin/dropbearkey\nusr/bin/scp\nusr/bin/ssh\nusr/sbin/dropbearmulti" >> /opt/.filetool.lst

cd /tmp
echo "/etc/init.d/dropbear start" >> /opt/bootsync.sh
echo "/usr/local/httpd/sbin/httpd -p 80 -h /home/tc/htdocs -u tc:staff" >> /opt/bootsync.sh
echo "export GIT_SSL_NO_VERIFY=true" >> /home/tc/.ashrc
echo "sh /etc/rc.local" >> /opt/bootsync.sh
cd /home/tc

#Set up a password for tc user (necessary for sftp and other remote tools)
echo -e "foo\nfoo" | passwd tc > /dev/null
echo -e "etc/passwd\netc/shadow" >> /opt/.filetool.lst

filetool.sh -b >> /dev/null

