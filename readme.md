# Kimai Auto-Update

## About:
This shell script updates your Kimai installation automatically. 

I created this script with a Debian based Plesk-Server in mind.

## Things to change:
You only have to change th variables in the "#Variables" section to yours.

## How to run:
- Create a file e.g.: "nano kimai-update.sh"
- Give the file the needed permissions: "chmod 0755 kimai-update.sh"
- Run it: "sudo bash kimai-update.sh"
- Choose if you want to install composer dependencies as root-user by adding -y or -n when asked
