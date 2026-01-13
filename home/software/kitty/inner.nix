{ lib, config, ... }:

let

  flavor = config.style.theme.flavor;
  capitalizedFlavor = if flavor == "" then
    flavor
  else
    let
      first = lib.toUpper (lib.substring 0 1 flavor);
      rest = lib.substring 1 (lib.stringLength flavor - 1) flavor;
    in "${first}${rest}";
  kittyThemeName = "Catppuccin-${capitalizedFlavor}";
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
