# changedetect
Changedetect is a simple script for both Debian and Redhat based systems that notifies the user when the /var/log foler has been modified. It uses hashing to compare earlier versions of the /var/log directory to a current version and logs the differences in statlog.txt. This script works well with ```crontab -e``` as root. 

The script creates 3 new files to complete this task so make sure to run this script in a folder. 

## Crontab
```5 * * * * {DIRECTORYSTRUCTURE}/changedetect.sh```
This runs the script every 5 minutes, you can change that to your liking. 

