#!/bin/bash
shopt -s expand_aliases
source ~/.shortcuts
echo "PSM Database is loading from Google drive"
rc-backup
uz-latest
sync-storage-psm
#cp-storage-psm

file="/home/admin/laravel-backups/db-dumps/mysql-psm_portal.sql"

if head -n 1 "$file" | grep -q "enable the sandbox mode"; then
	# Use sed to remove the first line and save the changes in place
	sed -i '1d' "$file"
fi

upto-db
# to get backup folder backto storage/app we need to git reset
psm && git reset --hard
cd .. && sudo ./permpsm.sh
echo "OK"
