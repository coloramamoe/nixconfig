{ config, pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 10;
      adjust_line_height = 0;
      adjust_column_width = 0;
      disable_ligatures = "never";

      window_padding_width = 12;
      remember_window_size = false;

      cursor_shape = "beam";
      cursor_beam_thickness = 1.5;
      cursor_blink_interval = 0;
      cursor_stop_blinking_after = -1;

      mouse_hide_wait = 1.0;

      bell_on_tab = false;
      bell_path = "none";

      scrollback_lines = 10000;

      background_opacity = 1.0;

      background = "#161821";
      foreground = "#c6c8d1";

      selection_foreground = "#161821";
      selection_background = "#84a0c6";

      url_color = "#89b8c2";

      color0 = "#161821";
      color8 = "#6b7089";

      color1 = "#e27878";
      color9 = "#e98989";

      color2 = "#b4be82";
      color10 = "#c0ca8e";

      color3 = "#e2a478";
      color11 = "#e9b189";

      color4 = "#84a0c6";
      color12 = "#91acd1";

      color5 = "#a093c7";
      color13 = "#ada0d3";

      color6 = "#89b8c2";
      color14 = "#95c4ce";

      color7 = "#c6c8d1";
      color15 = "#d2d4de";

      hide_window_decorations = true;
      confirm_os_window_close = 0;
      shell = "fish";
    };
  };
}
