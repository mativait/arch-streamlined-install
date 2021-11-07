

#yes | pacman -Sy parted vim htop


( echo d ; echo w ; echo q) |  fdisk /dev/sda
( echo n ; echo p; echo ; echo ; echo +256M ; echo a; \
  echo n ; echo p; echo ; echo ; echo;  echo w ; echo q \
  ) |  fdisk /dev/sda


mkfs.ext4 /dev/sda2

mount /dev/sda2  /mnt

yes | pacstrap  /mnt base linux linux-firmware vim htop iotop  make

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/NZ /etc/localtime # TODO change

hwclock --systohc

locale-gen

echo "archdev" > /etc/hostname # TODO change

mkinitcpio -P





