#!/bin/sh
#set -x
IP_CHECKER="http://icanhazip.com/"
if ! hash curl 2>/dev/null; then
	echo "ERROR: cURL is missing."
	exit 1
fi
MY_IP=$(curl --silent "$IP_CHECKER")
echo "$MY_IP"
exit 0
