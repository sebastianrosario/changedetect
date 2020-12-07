#!/bin/bash
date=$(date)

# If statement that checks to see whether the file that is created by the program exists
# to choose what path the program goes down, either hashing /var/log for the first time 
# or for the second time to compare.

if [ -f 'oldhash.txt' ] ;
then
	echo "Checking existing hash with new hash"
	# Stores the output of stat /var/log in a variable
	newStat=$(stat /var/log)

	# Hashes stat /var/log
	newHashOutput=$(stat /var/log | sha256sum)

	# Stores the old hash in a variable
	oldHash=$(cat oldhash.txt)

	# Stores the new hash in a file
	echo $newHashOutput > newhash.txt
	newHashFile=$(cat newhash.txt)

	# Checks to see if the strings of the file are the same
	if [[ $oldHash == $newHashFILE ]] ;
	then
		# If no changes are detected the user is shown the two hashes for verification
		echo "No changes detected."
		echo $newHashFILE
		echo $oldHash
	else
		# If changes are detected, usre is shown the two hashes for verification
		# the current hash is stored in the oldhash file and the output of 
		# stat /var/log is logged into statlog.txt with the date
		echo "Change Detected, logging change and replacing old hash"

		echo $newHash
		echo $oldHash
		echo $newHash > oldhash.txt

		echo -e "$date \n $newStat \n" >> statlog.txt
	fi
else
	# If the file oldhash.txt does not exist the script has never been run.
	# The script creates oldhash.txt and hashes stat /var/log into that file
	echo "Creating hashfile of /var/log, logging in statlog.txt"

	oldHashStartup=$(stat /var/log | sha256sum)
	oldHashStatStart=$(stat /var/log)

	echo $oldHashStartup > oldhash.txt
	echo $oldHashStatStart > statlog.txt
fi

