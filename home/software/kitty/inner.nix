{ lib, config, ... }:

let

  variant = config.style.theme.variant;
  capitalizedVariant = if variant == "" then
    variant
  else
    let
      first = lib.toUpper (lib.substring 0 1 variant);
      rest = lib.substring 1 (lib.stringLength variant - 1) variant;
    in "${first}${rest}";
  kittyThemeName = "Catppuccin-${capitalizedVariant}";
in
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;

    font = {
      name = config.style.font.mono;
      size = 14.0;
    };

    themeFile = kittyThemeName;

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
