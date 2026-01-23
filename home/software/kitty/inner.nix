{ config, ... }:

let
  lookup = import ../../../_lib/getStyle.nix { };
  fonts = (lookup.getStyle config).fonts or { };
  monoDefault = (fonts.mono or { }).default or "JetBrainsMono Nerd Font";
in {
  imports = [ ./themes ];

  programs.kitty = {
    enable = true;
    enableGitIntegration = true;

    font = {
      name = monoDefault;
      size = 14.0;
    };

    shellIntegration = {
      mode = "no_cursor";
      enableZshIntegration = true;
    };

    settings = {
      background_opacity = 0.9;
      background_blur = 1;
      remember_window_size = false;
    };
  };
}
