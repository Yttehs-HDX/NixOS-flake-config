{ config, lib, ... }:

let
  mkCatppuccinTheme =
    import ../../../../desktop/styles/themes/catppuccin/_lib/mkCatppuccinTheme.nix {
      inherit lib config;
    };
  capitalize = value:
    if value == "" then
      value
    else
      let
        first = lib.toUpper (lib.substring 0 1 value);
        rest = lib.substring 1 (lib.stringLength value - 1) value;
      in "${first}${rest}";
in {
  config = mkCatppuccinTheme ({ flavor, ... }: {
    programs.kitty.themeFile = "Catppuccin-${capitalize flavor}";
  });
}
