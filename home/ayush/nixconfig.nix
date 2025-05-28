{ config, pkgs, ... }:

{


fileSystems."/mnt/ayush" = {
device = "//192.168.86.22/Ayush";
fsType = "smb";
options = [ "username=ayush" "x-systemd.automount" "noauto" ];



}
