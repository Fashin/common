#!/bin/bash

# Usage
show_help() {
	cat << EOF
Usage: ${0##*/} [-h[-s[-r[-k[
Common helper for phpmyadmin gesture and mysql server

	-h	Display this helper
	-s	Run common mysql start and phpmyadmin on background
	-r	Restart common mysql and phpmyadmin
	-k	Stop common mysql and phpmyadmin
EOF
}

printf '$alias'

if type phpmyadmin 2>/dev/null; then
	echo "phpmyadmin found"
	#echo "alias phpmyadmin='cd ~/phpMyAdmin; php -S localhost:6060'" >> ~/.zshrc
	#source ~/.zshrc
else
	echo "phpmyadmin not found"
fi

exit 0

while getopts hsrk: opt; do
	case $opt in
		h)
			show_help
			;;
		s)
			mysql.server start
			phpmyadmin &>/dev/null &
			export TMP_PHPMYADMIN=$!
			;;
		r)
			mysql.server restart
			phpmyadmin
			;;
		k)
			mysql.server stop
			if [-z "$TMP_PHPMYADMIN"]; then 
				kill $TMP_PHPMYADMIN
			else
				echo "Can't retrieve phpmyadmin PID"
			fi
			;;
	esac
done
