{ config, pkgs, lib, ... }:
{
  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "ptb";
      minimizeToTray = true;
      arRPC = true;
      splashColor = "rgb(220, 220, 223)";
      splashBackground = "rgb(0, 0, 0)";
    };
  };
}
