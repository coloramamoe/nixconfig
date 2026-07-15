{ config, pkgs, lib, ... }:
{
  services.scx.enable = true;
  services.scx.scheduler = "scx_rustland";

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false;
    dedicatedServer.openFirewall = false;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  programs.gamescope = {
    enable = true;
    package = pkgs.gamescope_git;
  };

  powerManagement.cpuFreqGovernor = "performance";

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/colorama/.steam/root/compatibilitytools.d";
    MANGOHUD = "1";
    OBS_VKCAPTURE = "1";
  };

  systemd.services.scx.serviceConfig = {
    MemoryMax = "256M";
    CPUQuota = "30%";
  };
}
