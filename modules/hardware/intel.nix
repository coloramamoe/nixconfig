{ config, pkgs, lib, ... }:
{
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  services.thermald.enable = false;
}
