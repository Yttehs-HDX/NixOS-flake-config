{ lib, config, ... }:

let
  palettes = import ./inner/palettes.nix { };
  themeName = config.name or "";
  flavor = config.flavor or "mocha";
  accentName = config.accent or "lavender";
  palette = palettes.${flavor} or palettes.mocha;
  accent = palette.${accentName} or palette.lavender;
in {
  config = lib.mkIf (themeName == "catppuccin") {
    palette = palette // {
      accent = accent;
      accentName = accentName;
    };
  };
}
