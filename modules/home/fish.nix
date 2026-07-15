{ config, pkgs, lib, ... }:
{
  programs.fish = {
    enable = true;

    plugins = let
      tide = pkgs.runCommand "tide" {} ''
        mkdir -p $out/{functions,completions,conf.d}
        for f in ${pkgs.fishPlugins.tide}/share/fish/vendor_functions.d/*.fish; do
          ln -s "$f" "$out/functions/"
        done
        for f in ${pkgs.fishPlugins.tide}/share/fish/vendor_conf.d/*.fish; do
          ln -s "$f" "$out/conf.d/"
        done
        for f in ${pkgs.fishPlugins.tide}/share/fish/vendor_completions.d/*.fish; do
          ln -s "$f" "$out/completions/"
        done
      '';
    in [
      {
        name = "tide";
        src = tide;
      }
    ];

    shellAbbrs = {
      nru = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos";
      nrb = "sudo nixos-rebuild boot";
      nrt = "sudo nixos-rebuild test";
      nrc = "sudo nix-collect-garbage -d";
      nrh = "sudo nixos-rebuild switch --show-trace";
      upd = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos";
      gs = "git status";
      gc = "git commit -m";
      cat = "bat";
      ls = "eza -l --icons";
      lt = "eza -la --icons --tree --level=2";
      ff = "fastfetch";
      mangohud = "mangohud %";
      gamemode = "gamemoderun %";
      nixconf = "sudo micro /etc/nixos/flake.nix";
      nixflake = "sudo micro /etc/nixos/flake.nix";
      niriconf = "micro ~/.config/niri/config.kdl";
      fishconf = "micro ~/.config/fish/config.fish";
      clean = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
      sysu = "systemctl --user";
      sys = "systemctl";
      jc = "journalctl -xe -n 50 --no-pager";
      jcf = "journalctl -xfe";
    };

    shellAliases = {
      dps = "docker ps";
      di = "docker images";
    };
  };
}
