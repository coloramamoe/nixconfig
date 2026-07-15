{ config, pkgs, lib, ... }:
{
  networking.hostName = "nixos";
  networking.extraHosts = "2.17.145.32 client-update.steamstatic.com";

  networking.networkmanager.enable = false;
  networking.wireless.enable = false;
  networking.useNetworkd = true;

  networking.firewall.enable = false;
  networking.nftables.enable = true;
}
