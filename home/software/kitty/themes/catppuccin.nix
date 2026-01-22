{ config, lib, ... }:

let
  theme = config.desktop.style.theme or { };
  themeName = theme.name or "";
  flavor = theme.flavor or "mocha";
  capitalize = value:
    if value == "" then
      value
    else
      let
        first = lib.toUpper (lib.substring 0 1 value);
        rest = lib.substring 1 (lib.stringLength value - 1) value;
      in "${first}${rest}";
in {
  config = lib.mkIf (themeName == "catppuccin") {
    programs.kitty.themeFile = "Catppuccin-${capitalize flavor}";
  };
}
