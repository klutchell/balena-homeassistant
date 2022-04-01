#!/usr/bin/env bash

mapfile -t usb_devices < <(lsblk -J -O | jq -r '.blockdevices[] | 
    select(.subsystems=="block:scsi:usb:platform" or .subsystems=="block:scsi:usb:pci:platform") | 
    .path, .children[].path')

# automount USB device partitions at /media/{UUID}
if [ ${#usb_devices[@]} -gt 0 ]
then
    for uuid in $(blkid -sUUID -ovalue "${usb_devices[@]}")
    do
        mkdir -pv "/media/${uuid}"
        mount -v UUID="${uuid}" "/media/${uuid}" || continue

        # bind mount on top of existing volume
        mkdir -p "/media/${uuid}/frigate" /media/frigate
        mount -v -o bind "/media/${uuid}/frigate" /media/frigate

        break
    done
fi

# modprobe gasket >/dev/null 2>&1 || true
# modprobe apex >/dev/null 2>&1 || true

exec /init python3 -u -m frigate
