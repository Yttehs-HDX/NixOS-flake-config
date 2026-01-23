{ config, pkgs, lib, ... }:

let
  lookup = import ../../../../_lib/getStyle.nix { };
  theme = lookup.getTheme config;
  palette = theme.palette or { };
  themeName = theme.name or "";
  lavender = builtins.substring 1 6 (palette.lavender or "#000000");
  pink = builtins.substring 1 6 (palette.pink or "#000000");

  swaylock-themed = pkgs.writeShellApplication {
    name = "swaylock-themed";
    runtimeInputs = [ pkgs.swaylock-effects ];
    text = ''
      swaylock \
        --screenshots \
        --clock \
        --text-color=${lavender} \
        --text-caps-lock-color=${pink} \
        --indicator \
        --indicator-radius 100 \
        --indicator-thickness 7 \
        --effect-blur 25x25 \
        --effect-vignette 0.5:0.5 \
        --ring-color ${lavender} \
        --key-hl-color ${pink} \
        --line-color 00000000 \
        --inside-color 00000088 \
        --separator-color 00000000
    '';
  };
in lib.mkIf (themeName == "catppuccin") { home.packages = [ swaylock-themed ]; }
