{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [ fuzzel ];

  xdg.configFile."fuzzel/fuzzel.ini".text = ''
    [main]
    font=JetBrainsMono Nerd Font:size=12
    dpi-aware=auto
    lines=12
    prompt=> 
    placeholder=Search...

    [colors]
    background=161821ff
    text=c6c8d1ff
    match=84a0c6ff
    selection=2e3451ff
    selection-text=c6c8d1ff
    selection-match=89b8c2ff
    border=3e445eff

    [border]
    width=2
    radius=6
  '';
}
