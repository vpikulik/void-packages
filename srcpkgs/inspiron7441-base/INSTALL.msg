This package adds initramfs configuration for the Dell Inspiron 14 Plus 7441.

Upstream linux-firmware currently does not ship all board-specific firmware
needed by this machine. For best results, provide these files under:

  /usr/lib/firmware/qcom/x1e80100/dell/inspiron-14-plus-7441/

Expected files:
- qcdxkmsuc8380.mbn
- qcadsp8380.mbn
- adsp_dtbs.elf
- qccdsp8380.mbn
- cdsp_dtbs.elf
- qcvss8380.mbn

The package will include any of the above that already exist locally in the
initramfs, along with qcom/gen80100_sqe.fw, qcom/gen80100_aqe.fw,
qcom/gen80100_gmu.bin, and qcom/x1e80100/gen70500_zap.mbn.
