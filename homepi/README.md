# homepi

## install iptables-persistent
### /etc/iptables/rules.v4 + /etc/iptables/rules.v6
sudo apt install iptables-persistent
ln repo/iptables/rules.v4 /etc/iptables/rules.v4
ln repo/iptables/rules.v6 /etc/iptables/rules.v6


## unattendend-updates

sudo apt install unattended-upgrades apt-config-auto-update
