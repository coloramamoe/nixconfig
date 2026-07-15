{ config, pkgs, lib, ... }: {
  gtk = {
    enable = true;
      cursorTheme = {
      name = "material_dark_cursors";
      package = pkgs.material-cursors;
      size = 24;
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  home.sessionVariables = {
    XCURSOR_THEME = "material_dark_cursors";
    XCURSOR_SIZE = "24";
  };
}
