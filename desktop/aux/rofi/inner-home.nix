{ pkgs, ... }:

{
  imports = [ ./themes/default.nix ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    modes = [ "run" "drun" "window" "filebrowser" ];
    terminal = "kitty";

    extraConfig = {
      # matching = "fuzzy";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      hide-scrollbar = false;
      display-drun = "󰵆  Apps ";
      display-run = "  Run ";
      display-window = "󰕰  Window";
      display-filebrowser = "󰉋  File";
      sidebar-mode = true;
    };

  };
}
