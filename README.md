# apt-btrfs-snapper

This tool hooks into the apt install/remove/update process and creates two snapshots. One before and one after the packages have been installed/removed.

At the momemt you need to have a snapper config for your root file system with the name "root".


## Installation

1. you need to have a deb based system and a btrfs subvolume as your root file system
2. you neet to install snapper (http://snapper.io)
  `apt-get install snapper`
3. you need to create a snapper config for the root file system which has to have **root** as name
  `snapper create-config /`
4. download the files from this repository and place them as followd:
   80snapper => /etc/apt/apt.conf.d/
   apt-btrfs-snapper => /usr/bin/ (or /usr/local/bin, somewhere in the PATH)
5. now you can do a `apt-get install xxx`
6. check if it worked: `snapper -c root list`. You should see two snapshots (one *pre* and one *post*)
7. to see the change from the apt-get you can do `snapper -c root status PRENUM..POSTNUM`, where PRENUM and POSTNUM are the snapper snapshot numbers from 6.


## Tweaks
* The snapper config can be configured using the snapper command or by editing the file /etc/snapper/configs/root. (e.g. turn on/off time snapshots, snapshot cleanup policy)
* If /tmp is a folder of root (/) maybe use tmpfs or create a subvolume for it.
* Create a subvolume for /var/cache (at least for /var/cache/apt/archives) and maybe /var/log
