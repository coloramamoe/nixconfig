{ config, pkgs, lib, ... }:
{
  services.flatpak.enable = true;
  services.fstrim.enable = true;
  services.journald.extraConfig = "Storage=none";
  services.speechd.enable = false;
  services.nscd.enable = lib.mkForce false;
  system.nssModules = lib.mkForce [];
  services.timesyncd.enable = false;
  services.acpid.enable = lib.mkForce false;
  systemd.oomd.enable = false;
  systemd.coredump.enable = false;
  zramSwap.enable = true;
  fileSystems."/".options = [ "noatime" "lazytime" ];

  systemd.services.nix-daemon.serviceConfig = {
    MemoryMax = "512M";
    CPUQuota = "50%";
    Nice = 19;
    IOSchedulingClass = lib.mkForce "idle";
  };

  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="sdb", ATTR{queue/scheduler}="none"
  '';
}
