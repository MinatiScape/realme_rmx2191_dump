#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:102760448:41f62739ee76b448f4687f95a6dfcd41bd7cf1f5; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/spmfw:34288:2bb4772163710333684e90af0c31dbd8017c2f86 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:102760448:41f62739ee76b448f4687f95a6dfcd41bd7cf1f5 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
