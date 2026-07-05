#!/bin/sh

check() {
	return 0
}

depends() {
	return 0
}

install() {
	inst_hook pre-mount 00 "$moddir/save-logs.sh"
	inst_hook cleanup 99 "$moddir/save-logs.sh"
	inst_multiple mkdir mount umount date dmesg sync cat
}
