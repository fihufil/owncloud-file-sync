# owncloud-file-sync
OwnCloud file sync for Ubuntu Touch.

## Installation
Install `owncloud-client-cmd_2.1.1_armhf.click`
 
Copy upstart script `upstart/owncloud-sync.conf` into `~/.config/upstart`

Copy script `bin/owncloud-sync.sh` into `~/bin/`

Make it executable `chmod +x bin/owncloud-sync.sh`

Copy config files from `config` to `~/` *(your home directory)*

## Configuration
Adjust config files 

`oc.cfg` with appropriate values

`oc-files` with list of paths in the following scheme:


`local path;remote path`

eg. Sync /home/phablet/Documents with /remote.php/webdav/Documents:

`/home/phablet/Documents;Documents`


