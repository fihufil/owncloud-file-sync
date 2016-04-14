# owncloud-file-sync
OwnCloud file sync for Ubuntu Touch.

## Installation
Install `owncloud-client-cmd_2.1.1_armhf.click` with `pkcon install-local --allow-untrusted owncloud-client-cmd_2.1.1_armhf.click`
 
Copy upstart script `upstart/owncloud-sync.conf` into `~/.config/upstart`

Copy script `bin/owncloud-sync.sh` into `~/bin/`

Make it executable `chmod +x bin/owncloud-sync.sh`

Copy config files from `config` to `~/` *(your home directory)*

Create `.logs` folder with `mkdir ~/.logs/`

## Configuration
Adjust config files 

`oc.cfg` with appropriate values



`oc-files` with list of paths in the following scheme:


`local path;remote path`

eg. Sync /home/phablet/Documents with /remote.php/webdav/Documents:

`/home/phablet/Documents;Documents`

## click package

Click package consist of following packages pulled from Debian Sid repository for armhf:
- libdbus-1-3_1.10.8-1_armhf.deb
- libicu55_55.1-7_armhf.deb
- libowncloudsync0_2.1.1+dfsg-1_armhf.deb
- libpcre16-3_2%3a8.38-3.1_armhf.deb
- libqt5core5a_5.5.1+dfsg-16_armhf.deb
- libqt5dbus5_5.5.1+dfsg-16_armhf.deb
- libqt5gui5_5.5.1+dfsg-16_armhf.deb
- libqt5keychain0_0.5.0-1_armhf.deb
- libqt5network5_5.5.1+dfsg-16_armhf.deb
- libqt5sql5-sqlite_5.5.1+dfsg-16_armhf.deb
- libqt5widgets5_5.5.1+dfsg-16_armhf.deb
- libssl1.0.2_1.0.2g-1_armhf.deb
- libstdc++6_5.3.1-13_armhf.deb
- owncloud-client-cmd_2.1.1+dfsg-1_armhf.deb
