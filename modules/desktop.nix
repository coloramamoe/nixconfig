{ config, pkgs, lib, ... }:
{
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    swaybg
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
    xdg-desktop-portal
    grim
    slurp
    wtype
    wl-clipboard
  ];

  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    config = {
      common.default = "gtk";
    };
  };

  xdg.mime.defaultApplications = {
    "x-scheme-handler/http" = "zen-beta.desktop";
    "x-scheme-handler/https" = "zen-beta.desktop";
    "text/html" = "zen-beta.desktop";
    "text/xml" = "zen-beta.desktop";
    "application/xhtml+xml" = "zen-beta.desktop";
    "application/xml" = "zen-beta.desktop";
    "inode/directory" = "org.kde.dolphin.desktop";
  };

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
    GTK_THEME = "Adwaita:dark";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    BROWSER = "zen-beta";

    XKB_DEFAULT_LAYOUT = "us,ru";
    XKB_DEFAULT_OPTIONS = "grp:alt_shift_toggle";

    XCURSOR_THEME = "material_dark_cursors";
    XCURSOR_SIZE = "24";
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-esr;
  };

  programs.foot.enable = true;

  programs.dconf.enable = true;
  programs.fish.enable = true;
}
