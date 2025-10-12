{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    modes = [
      "run" "drun" "window" "filebrowser"
    ];
    terminal = "kitty";

    extraConfig = {
      matching = "fuzzy";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      hide-scrollbar = false;
      display-drun = "  Apps ";
      display-run = "  Run ";
      display-window = "󰕰  Window";
      display-filebrowser = "󰉋  File";
      sidebar-mode = true;
    };

    font = "${config.userTheme.fontFamily} ${toString config.userTheme.fontSize}";
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        border-col = mkLiteral "#ca9ee6ff";
        bg-col = mkLiteral "rgba(30, 30, 46, 0.75)";
        bg-col-light = mkLiteral "rgba(49, 50, 68, 0.7)";
        fg-col = mkLiteral "#cdd6f4";
        highlight = mkLiteral "#89b4fa";
        accent = mkLiteral "#b4befecc";
        text = mkLiteral "#6c7086";
        width = 800;
      };

      "element-text, element-icon , mode-switcher" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      window = {
        height = mkLiteral "480px";
        border = mkLiteral "2px";
        border-radius = mkLiteral "15px";
        border-color = mkLiteral "@border-col";
        background-color = mkLiteral "@bg-col";
      };

      mainbox = {
        background-color = mkLiteral "transparent";
      };

      inputbar = {
        children = mkLiteral "[prompt,entry]";
        border-radius = mkLiteral "5px";
        background-color = mkLiteral "inherit";
        margin = mkLiteral "10px 10px 0px";
      };

      prompt = {
        border-radius = mkLiteral "15px";
        background-color = mkLiteral "@highlight";
        text-color = mkLiteral "@bg-col";
        padding = mkLiteral "10px";
      };

      entry = {
        border-radius = mkLiteral "15px";
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@fg-col";
        padding = mkLiteral "13px 10px"; # force alignment with prompt
        margin = mkLiteral "0px 0px 0px 5px";
      };

      listview = {
        background-color = mkLiteral "inherit";
        columns = 3;
        margin = mkLiteral "10px 10px 0px";
      };

      element = {
        border-radius = mkLiteral "15px";
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "@fg-col";
        padding = mkLiteral "10px";
      };

      "element selected" = {
        text-color = mkLiteral "@bg-col";
        background-color = mkLiteral "@accent";
      };

      element-icon = {
        border-radius = mkLiteral "10px";
        size = mkLiteral "32px";
        padding = mkLiteral "5px";
        margin = mkLiteral "0px 5px 0px 0px";
      };

      element-text = {
        border-radius = mkLiteral "10px";
        vertical-align = mkLiteral "0.5";
        text-color = mkLiteral "0.5";
        padding = mkLiteral "10px";
      };

      "element-text selected" = {
        background-color = mkLiteral "@accent";
        text-color = mkLiteral "inherit";
      };

      mode-switcher = {
        spacing = 0;
      };

      button = {
        background-color = mkLiteral "@bg-col-light";
        text-color = mkLiteral "@text";
        padding = mkLiteral "10px";
      };

      "button selected" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@highlight";
      };

      message = {
        background-color = mkLiteral "inherit";
        margin = mkLiteral "10px 10px 0px";
      };

      textbox = {
        border-radius = mkLiteral "10px";
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@accent";
        padding = mkLiteral "10px";
      };
    };
  };
}

