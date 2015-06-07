# This grabs and loads extra files from the /Ingredients/Custom folder
# as specified in the .extras/extras.lst file

while read package; do
	case "$package" in \#*) continue ;; esac
	[ -z "$package" ] && continue
	tftp -g -l /mnt/sdc1/tce/optional/$package.tcz -r /Ingredients/Custom/$package.tcz 10.0.2.2
	sudo -u tc tce-load -i $package > /dev/null
done < extras.lst
