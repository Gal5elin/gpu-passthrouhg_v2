so basic structure is /etc/libvirt/hooks/qemu.d/*name_of_vm*/
in /*name_of_vm*/ you have folders "prepare" and "release"
final structure is /etc/libvirt/hooks/qemu.d/win10/prepare/begin/ and /etc/libvirt/hooks/qemu.d/win10/release/end/
in begin and end folders u put scripts that will be executed whe nu start the vm and when u close it, respetevly.
so start.sh goes to begin and revert.sh goes to end folder.
also qemu script goes to hooks folder
