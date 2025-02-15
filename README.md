My dotfiles.

Kinda a mess but works.

# Drivers and Patches
Fan: [mbpfan](https://github.com/linux-on-mac/mbpfan)

Sound: [snd_hda_mackbookpro](https://github.com/davidjo/snd_hda_macbookpro)

Camera: [bcwc_pcie](https://github.com/patjak/facetimehd/wiki) 

Palm Rejection: Store `local-overrides.quirks` file in the repo at `/etc/libinput/local-overrides.quirks`

Keyboard Backlight: See DoYouEvenSheesh/kbdlight and compile

## Disable Autoboot
To disable auto boot from within Linux, ensure that `efivarfs` is mounted and run:
```
printf "\x07\x00\x00\x00\x00" > /sys/firmware/efi/efivars/AutoBoot-7c436110-ab2a-4bbb-a880-fe41995c9f82
```
If you get "No space left on device" errors, it's probably because of dump-type0-*-variables written by the Linux kernel taking up all space. Removing them solves the problem:
```
for i in $(find /sys/firmware/efi/efivars/ -name 'dump-type0*'); do chattr -i $i; rm $i; done
```
To re-enable auto boot again run:
```
chattr -i /sys/firmware/efi/efivars/AutoBoot-7c436110-ab2a-4bbb-a880-fe41995c9f82
rm /sys/firmware/efi/efivars/AutoBoot-7c436110-ab2a-4bbb-a880-fe41995c9f82
```





