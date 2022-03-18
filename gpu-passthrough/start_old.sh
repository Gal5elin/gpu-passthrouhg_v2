# debugging
set -x

# load varibles we defined
source "/etc/libvirt/hooks/kvm.conf"

#stop DM
systemctl stop sddm.service

# unbind VTconsoles
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# unbind efi-framebuffer
echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/unbind

# avoid race
sleep 5

# unload nvidia
modprobe -r nvidia_drm
modprobe -r nvidia_modeset
modprobe -r drm_kms_helper
modprobe -r nvidia
modprobe -r i2c_nvidia_gpu
modprobe -r drm
modprobe -r nvidia_uvm

# unbind gpu
virsh nodedev-detach $VIRSH_GPU_VIDEO
virsh nodedev-detach $VIRSH_GPU_AUDIO

# load vfio
modprobe vfio
modprobe vfio_pci
modprobe vfio_iommu_type1
