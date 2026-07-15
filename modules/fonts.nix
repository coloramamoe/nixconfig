{ config, pkgs, lib, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    font-awesome
    material-icons
    nerd-fonts.jetbrains-mono
    inter
    google-fonts
  ];
}
