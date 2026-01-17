{ config, pkgs, ... }:

let
  palette = config.desktop.style.theme.palette;
  lavender = builtins.substring 1 6 palette.lavender;
  pink = builtins.substring 1 6 palette.pink;

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
in {
  home.packages = [
    pkgs.swaylock-effects
    swaylock-themed
  ];
}
