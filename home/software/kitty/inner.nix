{ config, ... }:

{
  imports = [
    ./themes/catppuccin.nix
  ];

  programs.kitty = {
    enable = true;
    enableGitIntegration = true;

    font = {
      name = config.desktop.style.fonts.mono.default;
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
