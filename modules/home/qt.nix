{ config, pkgs, lib, ... }: {
  qt = {
    enable = true;
    platformTheme = {
      name = "qt6ct";
      package = pkgs.qt6Packages.qt6ct;
    };
    style = {
      name = "kvantum";
      package = pkgs.qt6Packages.qtstyleplugin-kvantum;
    };
  };

  home.file.".config/Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=MateriaDark
  '';
}
