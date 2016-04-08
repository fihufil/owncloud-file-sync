#!/bin/bash
SHOW_HELP() {
echo "Usage:"
echo "$0 s to do manual sync"
echo "$0 to start syncing as daemon"
}
if [ "$1" = "--help" ]; then
	SHOW_HELP
	exit 0
fi

# config
CONFIGFILE="$HOME/oc.cfg"
FILECONFIG="$HOME/oc-files.cfg"
LOGFILE="$HOME/.logs/oc.log"
DEVICEUSER="phablet"
source $CONFIGFILE
LD_LIBRARY_PATH="/vendor/lib:/system/lib:/opt/click.ubuntu.com/owncloud-client-cmd/current/lib/arm-linux-gnueabihf/lib"
LC_ALL=C

### functions
# $1 = $OWNCLOUDUSER
# $2 = $OWNCLOUDSERVERDOMAIN
# $3 = $HTTPS
# $4 = $OWNCLOUDPASSWORD
# $5 = $LOCALPATH
# $6 = $REMOTEPATH
function owncloud {
	PROTOCOL="ownclouds"
	if [[ "$3" = "no" ]]; then
	PROTOCOL="owncloud"
	fi
	log "Syncing $5 with $PROTOCOL://$2/remote.php/webdav/$6"
	/opt/click.ubuntu.com/owncloud-client-cmd/current/lib/arm-linux-gnueabihf/bin/owncloudcmd "$5" "$PROTOCOL://$1:$4@$2/remote.php/webdav/$6"
	if [ $? != 0]; then
	log "Error occured. Please run $0 manually with s parameter"
	fi
}

function log {
        echo $(date +%Y%m%d-%H%M%S) : $* | tee -a $LOGFILE
}

if [ "$1" = "s" ]; then
	log "Manual sync"
fi
if [ "$1" != "s" ]; then
	sleep 60
fi

log "Sequence initialized"
while [ 1 ]; do ##### Main loop

log "Checking current network"
WIFI=`nmcli -t -f active,ssid dev wifi  | grep yes: | sed 's/^.\{4\}//g'`

if [ -n "$WIFI" ]; then


	log "Phone is using WiFi: $WIFI"
	log "Sync started"

	IFS=$';'
	while read LOCALPATH REMOTEPATH
	do

	owncloud $OWNCLOUDUSER $OWNCLOUDSERVERDOMAIN $HTTPS $OWNCLOUDPASSWORD $LOCALPATH $REMOTEPATH

	done < $FILECONFIG
	log "Sync ended"
else
	log "Phone is not using WiFI"
fi


if [ "$1" != "s" ]; then
        log "Suspending execution for $TIMER seconds"
	sleep $TIMER
fi

if [ "$1" = "s" ]; then
	log "Manual sync ended"
	exit 0
fi

done ##### Main loop end
