{ config, pkgs, lib, ... }:
{
  users.users."colorama" = {
    isNormalUser = true;
    description = "colorama";
    extraGroups = [ "wheel" "flatpak" "video" "input" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };
}
