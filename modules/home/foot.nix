{ config, pkgs, lib, ... }: {
  programs.foot.enable = true;

  xdg.configFile."foot/foot.ini".text = ''
    [main]
    shell=fish
    term=xterm-256color
    title=foot
    font=JetBrainsMono Nerd Font:size=10
    letter-spacing=0
    dpi-aware=no
    pad=25x25
    bold-text-in-bright=no

    [scrollback]
    lines=10000

    [cursor]
    style=beam
    blink=no
    beam-thickness=1.5

    [colors-dark]
    background=161821
    foreground=c6c8d1
    regular0=161821
    regular1=e27878
    regular2=b4be82
    regular3=e2a478
    regular4=84a0c6
    regular5=a093c7
    regular6=89b8c2
    regular7=c6c8d1
    bright0=6b7089
    bright1=e98989
    bright2=c0ca8e
    bright3=e9b189
    bright4=91acd1
    bright5=ada0d3
    bright6=95c4ce
    bright7=d2d4de

    [key-bindings]
    scrollback-up-page=Page_Up
    scrollback-down-page=Page_Down
    clipboard-copy=Control+c
    clipboard-paste=Control+v
    search-start=Control+f
    font-increase=Control+plus Control+equal Control+KP_Add
    font-decrease=Control+minus Control+KP_Subtract
    font-reset=Control+0 Control+KP_0

    [search-bindings]
    cancel=Escape
    find-prev=Shift+F3
    find-next=F3 Control+G
    delete-prev-word=Control+BackSpace

    [text-bindings]
    x03=Control+Shift+c
  '';
}
