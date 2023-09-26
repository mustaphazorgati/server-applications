# homepi

## create SSH key 
* ssh-keygen -t rsa -b 4096
* upload SSH key as deployment key to repository (don't forget write access!)

## copy primary SSH key into $HOME/.ssh/authorized_keys 

## copy GPG key (private + public) from main laptop
* append `export GPG_TTY=$(tty)` to ~/.bashrc

## copy .gitconfig from https://github.com/mustaphazorgati/dotfiles/blob/main/.gitconfig

## Execute devsec hardening guide (ansible script) for this server

## install docker
* https://docs.docker.com/engine/install/debian/

## install iptables-persistent
* sudo apt install iptables-persistent
* sudo ln -s <PATH_TO_REPO>/iptables/rules.v4 /etc/iptables/rules.v4

* sudo ln -s <PATH_TO_REPO>/iptables/rules.v6 /etc/iptables/rules.v6

## install unattended-updates
* sudo apt install unattended-upgrades apt-config-auto-update
* /etc/apt/apt.conf.d/20auto-upgrades 
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "3";
APT::Periodic::Verbose "1";
APT::Periodic::Unattended-Upgrade "1";
```
* /etc/apt/apt.conf.d/50unattended-upgrades
```
Unattended-Upgrade::Allowed-Origins {
  "Debian:oldstable-security";
  "Debian:oldstable";
  "CISOfy:stable";
  "Debian:oldstable-updates";
  "Raspberry Pi Foundation:stable";
  "Docker:bullseye";
};


Unattended-Upgrade::Automatic-Reboot "true";

Unattended-Upgrade::Automatic-Reboot-Time "04:00";
```
* verify with https://github.com/abhigenie92/unattended_upgrades_repos that all origins are valid

