# This grabs and loads extra files from the /Ingredients/Custom folder
# as specified in the .extras/extras.lst file
baseline=$(md5sum /home/tc/.extras/extras.lst | awk '{print $1}')

if [ "$baseline" != "9a3df88b3de7e2bef05b0ca274eb0bf4" ]; then
	while read package; do
		case "$package" in \#*) continue ;; esac
		[ -z "$package" ] && continue
		tftp -g -l /mnt/sdc1/tce/optional/$package.tcz -r /Ingredients/Custom/$package.tcz 10.0.2.2
		sudo -u tc tce-load -i $package > /dev/null
	done < /home/tc/.extras/extras.lst
else
	:
fi

exit 0
