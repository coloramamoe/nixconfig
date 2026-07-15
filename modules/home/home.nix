{ pkgs, zen-browser, ... }: {
  imports = [
    ./niri.nix
    ./foot.nix
    ./kitty.nix
    ./gtk.nix
    ./vesktop.nix
    ./fish.nix
    ./qt.nix
    ./opencode.nix
    ./fontconfig.nix
    ./fuzzel.nix
    ./waybar.nix
    zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisablePocket = true;
    };
    profiles.default.settings = {
      "zen.theme.accent-color" = "#99ccfa";
      "zen.widget.linux.transparency" = true;
    };
  };

  home = {
    username = "colorama";
    homeDirectory = "/home/colorama";
    stateVersion = "26.11";
  };

}
