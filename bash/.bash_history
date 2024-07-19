sudo apt update
sudo apt upgrade
cp /etc/sysctl.conf /etc/sysctl.conf.bak
sudo cp /etc/sysctl.conf /etc/sysctl.conf.bak
echo "#\n# Added by $USER" | sudo tee -a /etc/sysctl.conf
sudo echo "#\n# Added by $USER" | sudo tee -a /etc/sysctl.conf
sudo echo "vm.swappiness=10\n#" | sudo tee -a /etc/sysctl.conf
more /etc/sysctl.conf
sudo micro /etc/sysctl.conf
clear
sudo apt install cryptsetup
df -h
sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sda1
sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sda
lsblk
sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sda1
sudo cryptsetup luksOpen /dev/sda1 sda1
sudo mkfs.ext4 /dev/mapper/sda1
sudo tune2fs -m 0 /dev/mapper/sda1
sudo mkdir -p /mnt/data
sudo mount /dev/mapper/sda1 /mnt/data
sudo chown -R kanter:kanter /mnt/data
sudo umount /dev/mapper/sda1
sudo cryptsetup luksClose sda1
sudo mkdir -p /mnt/data/{.backgrounds,.crd,.icons,.fonts,.ssh,.themes,applications,Desktop,dev,Documents,Downloads,games,Music,notes,Pictures,prd,Public,Templates,Videos,vms}
sudo mkdir -p /mnt/nas/{backup,film,foto,gedeeld,homenas,kluis,muziek,muziekarchief,downloads,homewrk}
sudo micro /etc/fstab
sud mount -av
sudo mount -av
lsblk
cd /dev/sda1
exit
cd /media/
ls
kanter
cd kanter
ls
cd Data
ls
cd ..
cd kanter
ls
cd 1112f793-a758-4d6c-8e96-3b927577fde9/
LS
ls
cd /dev/mapper
ls
cd cd ~
cd ~
sudo cryptsetup luksUUID /dev/sbd1
sudo cryptsetup luksUUID /dev/sdb1
lsblk
sudo cryptsetup luksUUID /dev/sdb1
umount /dev/sda1
sudo umount /dev/sda1
lsblk
sudo fdisk -l
sudo apt install cryptsetup
sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sda1
sudo cryptsetup luksOpen /dev/sda1 sda1
sudo fdisk -l
lsblk
sudo mkfs.ext4 /dev/mapper/sda1
sudo tune2fs -m 0 /dev/mapper/sda1
cd /mnt/data/
ls
cd ~
sudo rm -rf /mnt/data/
sudo mkdir /mnt/data/
sudo mount /dev/mapper/sda1 /mnt/data
sudo touch /mnt/data/test.txt
sudo chown -R kanter:kanter /mnt/data
sudo umount /dev/mapper/sda1
sudo cryptsetup luksClose sda1
lsblk
sudo cryptsetup luksOpen /dev/sda1 sda1
sudo mount /dev/mapper/sda1 /mnt/data
sudo umount /dev/mapper/sda1
sudo cryptsetup luksClose sda1
sudo cryptsetup luksUUID /dev/sda1
sudo nano /etc/crypttab
sudo cp /etc/crypttab /etc/crypttab.bak
sudo nano /etc/crypttab
sudo nano /etc/fstab
sudo mount -av
sudo reboot
sudo apt remove blueman
sudo apt install plymouth plymouth-themes
sudo apt install plymouth-theme-breeze kde-config-plymouth
exit
sudo apt update && apt install firmware-iwlwifi
sudo apt update && sudo apt install firmware-iwlwifi
sudo apt autoremove
sudo apt update && sudo apt upgrade
sudo mkdir -p /mnt/data/{.backgrounds,.crd,.icons,.fonts,.ssh,.themes,applications,Desktop,dev,Documents,Downloads,games,Music,notes,Pictures,prd,Public,Templates,Videos,vms}
cd /mnt/data/
ls
ls -al
ls -alh
ls -lh
ls -lha
cd ..
ls
cd nas
ls
cd ..
ls -lha
cd data/
ls -lha
sudo micro /etc/fstab 
exit
cd /media
ls
cd kanter
ls
cd /mnt/
ls
cd
cd /mnt/
ls -l
ls -lh
ls -lha
ls -lhA
cd data
ls -lhA
sudo mkdir -p /mnt/data/{.backgrounds,.crd,.icons,.fonts,.ssh,.themes,applications,Desktop,dev,Documents,Downloads,games,Music,notes,Pictures,prd,Public,Templates,Videos,vms}
ls -lhA
ccd ../nas
cd ../nas
ls -lhA
zsh
sudo apt install synaptic
inxi
neofetch
exit
journalctl -b
journalctl -b | grep wifi
sudo journalctl -b | grep wifi
sudo apt install firmware-linux
sudo update-grub2
sudo plymouth-set-default-theme -l
sudo plymouth-set-default-theme -R breeze
exit
micro /etc/default/grub
sudo cp /etc/default/grub /etc/default/grub.bak
sudo micro /etc/default/grub
sudo update-grub2
exit
sudo micro /etc/default/grub
diff /etc/default/grub /etc/default/grub.bak
exit
sudo micro /etc/fstab 
pwd
ls
ls -lha
ls -lhA
mkdir -p /home/kanter/{.backgrounds,.crd,.icons,.fonts,.ssh,.themes,applications,Desktop,dev,Documents,Downloads,games,Music,notes,Pictures,prd,Public,Templates,Videos,vms}
ls -lhA
sudo mount -av
sudo systemctl daemon-reload
sudo mount -av
sudo micro /etc/fstab 
sudo systemctl daemon-reload
sudo mount -av
sudo micro /etc/fstab 
sudo systemctl daemon-reload
sudo mount -av
cd .backgrounds/
ls
ls -lhA
cd ..
ls -lhA
cd /mnt
ls
ls -lhA
sudo chown -R kanter:kanter /mnt/data
cd data/
ls -lhA
cd .backgrounds/
ls -lhA
sudo micro /etc/fstab 
sudo systemctl daemon-reload
sudo mount -av
cd ~
flatpak install flathub org.mozilla.Thunderbird
flatpak install flathub org.mozilla.firefox
flatpak install flathub com.zettlr.Zettlr
exit
flatpak install flathub org.kde.elisa
flatpak install flathub org.kde.digikam
sudo apt install libavcodec-extra
exit
flatpak list
flatpak install flathub org.kde.ark
flatpak install flathub org.kde.akregator
flatpak install flathub org.remmina.Remmina
flatpak install flathub io.github.aandrew_me.ytdn
flatpak install flathub com.github.qarmin.czkawka
flatpak install flathub org.kde.knights
flatpak install flathub org.kde.kmahjongg
flatpak install flathub com.google.Chrome
flatpak install flathub org.nmap.Zenmap
flatpak install flathub com.spotify.Client
flatpak install flathub org.videolan.VLC
flatpak install flathub org.signal.Signal
sudo micro /etc/fstab 
sudo mount -av
cd /mnt/nas
ls
ls -lHa
exit
sudo micro /etc/fstab 
which zsh
which bash
cd /bin
ls -lhA
exit
la
exit
htop
exit
ip a
exit
bat --version
which bat
sudo nala install bat
sudo apt install bat
which batcat
bat
s
bat
bat .bashrc 
exit
apt policy wine
export WINEARCH=win64
export WINEPREFIX=~/.wine/wine64testing
winecfg
mkdir ~/.wine/wine64testing
ls -al
mkdir .wine/wine64testing
mkdir -p .wine/wine64testing
winecfg
cd ~/.wine/wine64testing
ll
cd drive_c/
ls
cd users/
ls
cd..
..
echo $WINEPREFIX
echo
exit
ip a
ip a | grep 'inet '
exit
hostnamctl
hostnamectl
exit
micro .zshrc
source .zshrc
ll
la
exit
update
ls
ll
echo $shell
echo $SHELL
exit
ip a
exit
strace bash
sudo strace bash
sudo ins strace
sudo nala install strace
sudo strace bash
zsh
strace zsh
cd /
exot
exit
history > 20240627-0917-history-bash.log
history
history | oe
history | more
c
micro .bashrc 
s
exit
cd /etc
ll
~
cd ~
micro .bashrc
exit
la
ls
exit
cd ~
micro .bashrc
la
sudo apt search -t bookworm-backports fzf
sudo apt search -t bookworm-backports zoxide
zoxide --version
cd /usr/share/
which fzf
cd ../bin/fzF
cd ../bin/fzf
cd ../../bin
cd ../usr/bin
cd fzf
ls
ll
ll f*
exit
ll f*
exit
rm -rf .zsh*
cd .dotfiles/
stow .
cd ..
la
cd .dotfiles/
la
stow zsh
pwd
which kompare
cd .dotfiles
stow starship
