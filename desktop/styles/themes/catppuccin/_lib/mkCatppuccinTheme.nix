{ lib, config }:

let
  style = config.style;
  theme = style.theme;
  themeName = theme.theme;
  flavor = theme.flavor;
  accent = theme.accent;
  catppuccin = "catppuccin-${flavor}-${accent}";
in
mkConfig:
lib.mkIf (themeName == "catppuccin") (mkConfig {
  inherit style theme themeName flavor accent catppuccin;
})
