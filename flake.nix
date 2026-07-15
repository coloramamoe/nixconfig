{
  description = "NixOS gaming station — niri + waybar + fuzzel";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tg-ws-proxy = {
      url = "github:pialtor/tg-ws-proxy-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { self, nixpkgs, home-manager, tg-ws-proxy, zen-browser, chaotic, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit tg-ws-proxy zen-browser chaotic; };
      modules = [
        chaotic.nixosModules.default

        ./modules/hardware/hardware.nix
        ./modules/boot.nix
        ./modules/network.nix
        ./modules/locale.nix
        ./modules/system.nix
        ./modules/users.nix
        ./modules/desktop.nix
        ./modules/hardware/nvidia.nix
        ./modules/hardware/intel.nix
        ./modules/gaming.nix
        ./modules/audio.nix
        ./modules/fonts.nix
        ./modules/pkgs.nix
        ./modules/vpn.nix
        ./modules/tg-ws-proxy.nix
        ./modules/services.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit zen-browser; };
          home-manager.users.colorama = import ./modules/home/home.nix;
          home-manager.sharedModules = [ ];
        }
      ];
    };
  };
}
