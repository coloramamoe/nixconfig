{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [ niri waybar fuzzel ];

  xdg.configFile."niri/config.kdl".text = ''
    output "DP-1" {
        mode "1920x1080@144.002"
    }

    output "DVI-D-1" {
        mode "1920x1080@60.000"
    }

    input {
        keyboard {
            xkb {
                layout "us,ru"
                options "grp:alt_shift_toggle"
            }
        }

        touchpad {
            tap
            natural-scroll
        }

        focus-follows-mouse
        warp-mouse-to-focus
    }

    layout {
        gaps 8

        center-focused-column "on-overflow"

        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }

        default-column-width { proportion 0.5; }

        focus-ring {
            off
        }

        border {
            on
            width 3
            active-color "#84a0c6"
            inactive-color "#6b7089"
            urgent-color "#e27878"
        }

        shadow {
            on
            softness 8
            spread 4
            offset x=0 y=2
            color "#00000080"
        }
    }

    environment {
        LIBVA_DRIVER_NAME "nvidia"
        GBM_BACKEND "nvidia-drm"
        __GLX_VENDOR_LIBRARY_NAME "nvidia"
        WLR_NO_HARDWARE_CURSORS "1"
        GTK_THEME "Adwaita:dark"
        XDG_CURRENT_DESKTOP "niri"
        QT_QPA_PLATFORMTHEME "qt6ct"
        QT_STYLE_OVERRIDE "Adwaita-Dark"
        XCURSOR_THEME "material_dark_cursors"
        XCURSOR_SIZE "24"
        XCURSOR_PATH "/run/current-system/sw/share/icons:/etc/profiles/per-user/colorama/share/icons"
    }

    spawn-at-startup "waybar"
    spawn-at-startup "swaybg" "-i" "/home/colorama/.local/share/backgrounds/nord.png" "-m" "fill"

    hotkey-overlay {
        skip-at-startup
    }

    prefer-no-csd

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    animations {
        window-open {
            duration-ms 300
            curve "ease-out-expo"
        }
        window-close {
            duration-ms 250
            curve "ease-out-quad"
        }
        horizontal-view-movement {
            spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }
        window-movement {
            spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }
        window-resize {
            spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }
        workspace-switch {
            spring damping-ratio=1.0 stiffness=1000 epsilon=0.0001
        }
    }

    window-rule {
        geometry-corner-radius 6
        clip-to-geometry true
    }

    window-rule {
        match app-id=r#"firefox$"# title="^Picture-in-Picture$"
        open-floating true
    }

    window-rule {
        match app-id="kitty"
        opacity 1.0
    }

    window-rule {
        match is-focused=false
        opacity 1.0
    }

    binds {
        Mod+Shift+Slash { show-hotkey-overlay; }

        Mod+Return { spawn "kitty"; }
        Mod+D { spawn "fuzzel"; }
        Mod+Q repeat=false { close-window; }

        Mod+H { focus-column-left; }
        Mod+J { focus-window-down; }
        Mod+K { focus-window-up; }
        Mod+L { focus-column-right; }
        Mod+Left { focus-column-left; }
        Mod+Down { focus-window-down; }
        Mod+Up { focus-window-up; }
        Mod+Right { focus-column-right; }

        Mod+Shift+H { move-column-left; }
        Mod+Shift+J { move-window-down; }
        Mod+Shift+K { move-window-up; }
        Mod+Shift+L { move-column-right; }
        Mod+Shift+Left { focus-monitor-left; }
        Mod+Shift+Down { focus-monitor-down; }
        Mod+Shift+Up { focus-monitor-up; }
        Mod+Shift+Right { focus-monitor-right; }

        Mod+Ctrl+H { move-column-left; }
        Mod+Ctrl+J { move-window-down; }
        Mod+Ctrl+K { move-window-up; }
        Mod+Ctrl+L { move-column-right; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }

        Mod+Ctrl+1 { move-column-to-workspace 1; }
        Mod+Ctrl+2 { move-column-to-workspace 2; }
        Mod+Ctrl+3 { move-column-to-workspace 3; }
        Mod+Ctrl+4 { move-column-to-workspace 4; }
        Mod+Ctrl+5 { move-column-to-workspace 5; }
        Mod+Ctrl+6 { move-column-to-workspace 6; }
        Mod+Ctrl+7 { move-column-to-workspace 7; }
        Mod+Ctrl+8 { move-column-to-workspace 8; }
        Mod+Ctrl+9 { move-column-to-workspace 9; }

        Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }
        Mod+V { toggle-window-floating; }
        Mod+Shift+V { switch-focus-between-floating-and-tiling; }
        Mod+O repeat=false { toggle-overview; }

        Mod+R { switch-preset-column-width; }
        Mod+Shift+R { switch-preset-column-width-back; }
        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }

        Mod+C { center-column; }

        XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"; }
        XF86AudioMute allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
        XF86AudioMicMute allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }

        XF86AudioPlay allow-when-locked=true { spawn-sh "playerctl play-pause"; }
        XF86AudioPrev allow-when-locked=true { spawn-sh "playerctl previous"; }
        XF86AudioNext allow-when-locked=true { spawn-sh "playerctl next"; }

        XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "set" "+5%"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "set" "5%-"; }

        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
        Mod+Shift+E { quit; }
        Ctrl+Alt+Delete { quit; }
    }
  '';
}
