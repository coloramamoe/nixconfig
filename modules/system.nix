{ config, pkgs, lib, ... }:
{
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;
  
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };

  security.sudo-rs.enable = true;

  system.stateVersion = "26.05";
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos";
    allowReboot = false;
    dates = "weekly";
    persistent = true;
    operation = "switch";
  };
}
