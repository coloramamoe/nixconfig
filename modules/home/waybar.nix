{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [ waybar ];

  xdg.configFile."waybar/config.jsonc".text = ''
    {
        "layer": "top",
        "position": "top",
        "height": 28,
        "spacing": 10,
        "modules-left": [
            "niri/workspaces",
            "mpris"
        ],
        "modules-center": [
            "clock"
        ],
        "modules-right": [
            "pulseaudio",
            "cpu",
            "memory",
            "tray"
        ],
        "niri/workspaces": {
            "format": "{index}",
            "active-only": false,
            "on-click": "activate",
            "sort-by-number": true
        },
        "mpris": {
            "format": "󰎇 {title}",
            "tooltip": true,
            "max-length": 50
        },
        "clock": {
            "interval": 60,
            "format": "{:%H:%M}",
            "tooltip": true
        },
        "cpu": {
            "format": " {usage}%",
            "interval": 5
        },
        "memory": {
            "format": " {percentage}%",
            "interval": 10
        },
        "pulseaudio": {
            "format": "󰕾 {volume}%",
            "format-muted": "󰓠 {volume}%",
            "tooltip": false
        },
        "tray": {
            "icon-size": 16,
            "spacing": 6
        }
    }
  '';

  xdg.configFile."waybar/style.css".text = ''
    * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", "JetBrainsMono Nerd Font Mono", sans-serif;
        font-size: 12px;
        min-height: 0;
        padding: 0;
        margin: 0;
    }

    window#waybar {
        background: #161821;
        color: #c6c8d1;
    }

    #workspaces button {
        padding: 0 6px;
        background: transparent;
        color: #6b7089;
        min-width: 20px;
    }

    #workspaces button.active {
        color: #c6c8d1;
        background: rgba(62, 68, 94, 0.4);
    }

    #workspaces button.urgent {
        color: #e27878;
    }

    #workspaces button:hover {
        background: rgba(62, 68, 94, 0.3);
    }

    #clock, #cpu, #memory, #tray, #pulseaudio {
        padding: 0 6px;
        color: #c6c8d1;
    }

    #mpris {
        padding: 0 6px 0 14px;
        color: #c6c8d1;
    }
  '';
}
