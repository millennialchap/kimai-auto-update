#!/bin/bash

#written by MillennialChap 2023 - https://millennialchap.com
#Script under the GNU AGPLv3 license.

#Variables:
PHPpath="/opt/plesk/php/8.1/bin/php";
dir="/folders/to/your/kimai/installation";
user="yourwebuser";
group="yourusergroup";

#Starting script by going in to the Kimai-folder
echo "Going to Kimai installation";
cd $dir;

#Fetching the latest list of versions
echo "Fetching current version available on Github";
git fetch --tags;

#Setting variable for newest version
newest=$(git tag | grep "^[0-9]\+\.[0-9]\+\.[0-9]\+$" | sort -t. -k 1,1n -k 2,2n -k 3,3n | tail -1);

#Switching to the newest version
echo "Switching to the newest version";
git checkout $newest;

#Updating/Installing composer dependencies NOTE: YOU HAVE TO INTERACT HERE IN COMMANDLINE!
echo "Updating/Installing composer dependencies";
$PHPpath ../composer.phar install --optimize-autoloader;

#Updating Kimai
echo "Updating Kimai";
$PHPpath bin/console kimai:update;

#Moving one directory up
echo "Changing directory";
cd ../;

#Setting permissions again
echo "Setting correct permissions again (optional - change foldername)";
chown -R $user:$group kimai/;

#Done & Exit.
echo "Script finished.";
exit 0;
