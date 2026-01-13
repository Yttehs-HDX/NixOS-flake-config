{ lib, config, profile, ... }:

let
  palettes = import ./palettes.nix;
  styleProfile = profile.style or {};
in {
  imports = [
    ./default-value.nix
  ];

  config = lib.mkMerge [
    (lib.mkIf (styleProfile ? theme) {
      style.theme.theme = lib.mkDefault styleProfile.theme;
    })
    (lib.mkIf (styleProfile ? accent) {
      style.theme.accent = lib.mkDefault styleProfile.accent;
    })
    (lib.mkIf (styleProfile ? flavor) {
      style.theme.flavor = lib.mkDefault styleProfile.flavor;
    })
    (let
      theme = config.style.theme;
      flavor = theme.flavor or "mocha";
      accentName = theme.accent or "lavender";
      palette = palettes.${flavor} or palettes.mocha;
      accent = palette.${accentName} or palette.lavender;
    in {
      style.theme.palette = lib.mkIf (theme.theme == "catppuccin")
        (palette // {
          accent = accent;
          accentName = accentName;
        });
    })
  ];
}
