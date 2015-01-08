#!/bin/sh

# etherpost.sh
# Let's post some etherpad to a wordpress XML-RPC-API
# feat. shell, curl, python and its xmlrpclib

# DECLARE VARIABLES

# Wordpress XML-RPC-API-URL
WP_XMLRPC="https://netzpolitik.org/xmlrpc.php"

# Wordpress credentials
WP_USERNAME=""
WP_PASSWORD=""

# ID of the post to edit
WP_POST_ID=""

# Title of the post
WP_POST_TITLE="Title of my posting"

# Etherpad-URL
PAD_URL="http://localhost:9001/p/testpad"

# Update interval (in seconds)
INTERVAL="60" 

# Leave blank for non wpmu setups
WP_BLOG_ID=""	


# DEFINE FUNCTIONS

TMP_FILE="pad.tmp"


# Print if previous command ot return code zero (success)
check () {
	if [ $? -eq 0 ]
	then
        	echo " \033[33;32mDONE\033[33;0m."
	else
        	echo " \033[33;31mFAIL OK\033[33;0m."
	fi
}

# Print current time
time () {
	echo -n "\033[33;30m["
	printf %s "$(date +"%H:%M:%S")"
	echo -n "]\033[33;0m "
}


# THE LOOP

while true;
do

# Pull pad
time
echo -n "Getting pad\033[33;35m" $PAD_URL "\033[33;0m..."
curl -s $PAD_URL"/export/txt" > "$TMP_FILE"
check

# Push to wordpress
time
echo -n "Submitting to\033[33;35m" $WP_XMLRPC "\033[33;0m..."
python wpedit.py "$WP_XMLRPC" "$WP_USERNAME" "$WP_PASSWORD" "$WP_POST_ID" "$WP_POST_TITLE" "$WP_CONTENT" "$WP_BLOG_ID" "$TMP_FILE"
check

# Delete temporary file
time
echo -n "Deleting temporary file \033[33;35m"$TMP_FILE"\033[33;0m ..."
rm -f $TMP_FILE
check

# Sleep
time
echo -n "Sleeping\033[33;35m" $INTERVAL "seconds\033[33;0m ..."
sleep $INTERVAL
check

done
