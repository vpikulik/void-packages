#!/bin/sh

# Save early boot logs to a writable partition labelled VOIDLOGS.
# This is intentionally best-effort: boot must never fail because logging failed.

_logdev=/dev/disk/by-label/VOIDLOGS
_logmnt=/run/voidlogs
_logdir=$_logmnt/inspiron7441

[ -e "$_logdev" ] || exit 0

mkdir -p "$_logmnt" || exit 0
mount -o rw "$_logdev" "$_logmnt" 2>/dev/null || exit 0

_ts="$(date +%Y%m%d-%H%M%S 2>/dev/null || echo boot)"
mkdir -p "$_logdir" 2>/dev/null || true

if [ -r /run/initramfs/rdsosreport.txt ]; then
	cat /run/initramfs/rdsosreport.txt > "$_logdir/rdsosreport-${_ts}.txt" 2>/dev/null || true
fi

if command -v dmesg >/dev/null 2>&1; then
	dmesg > "$_logdir/dmesg-${_ts}.txt" 2>/dev/null || true
fi

if [ -r /proc/cmdline ]; then
	cat /proc/cmdline > "$_logdir/cmdline-${_ts}.txt" 2>/dev/null || true
fi

sync
umount "$_logmnt" 2>/dev/null || true
