{ config, pkgs, lib, ... }:
{
  programs.git.enable = true;

  programs.bat.enable = true;

  environment.systemPackages = with pkgs; [
    micro
    wget
    fastfetch
    materialgram

    swaybg
    grim
    slurp

    brightnessctl
    pavucontrol

    libnotify
    playerctl

    protonplus
    mangohud
    lutris
    protontricks
    osu-lazer-bin
    winetricks

    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.kio-extras
    kdePackages.ark


    wl-clipboard
    cliphist
    eza

    sing-box
    amnezia-vpn
    matugen
    material-cursors
    materia-kde-theme

    xwayland-satellite
    chrony
    mesa-demos
    vulkan-tools

    (pkgs.writeShellScriptBin "timesync" ''
      CONF=$(mktemp)
      cat > "$CONF" <<'EOF'
pool pool.ntp.org iburst
makestep 1 3
rtcsync
leapsecmode slew
EOF
      run0 ${pkgs.chrony}/bin/chronyd -q -f "$CONF"
      rm -f "$CONF"
    '')

  ];
}
