#!/bin/bash

display_usage(){
	echo "Usage: ./backup.sh <Path to your source> <path to backup folder>"

}


if [ $# -eq 0 ]; then
	display_usage
	exit 1
fi

source_dir=$1
backup_dir=$2
timestamp=$(date '+%y-%m-%d-%H-%M-%S')

create_backup(){
	zip -r "${backup_dir}/backup_${timestamp}.zip" "${source_dir}"

	if [ $? -eq 0 ]; then
		echo "backup generated successfully"
	fi
}

create_backup

perform_rotation(){
	backup=($(ls -t ${backup_dir}/backup_*.zip))

	echo "${backup[@]}"

	if [ "${#backup[@]}" -gt 5 ]; then
		echo "Performing Rotation for 5 Days"

		backups_to_remove=("${backup[@]:5}")
		echo "${backups_to_remove[@]}"

		for backup in "${backups_to_remove[@]}";
		do
			rm -f ${backup}
		done	
	fi

}

perform_rotation




