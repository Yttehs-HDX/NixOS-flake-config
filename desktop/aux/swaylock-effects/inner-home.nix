{ pkgs, ... }:

let
  mkShellScript = pkgs.writeShellScriptBin;
  swaylockThemed = mkShellScript "swaylock-themed" ''
    exec ${pkgs.swaylock-effects}/bin/swaylock \
      --screenshots \
      --clock \
      --text-color=b7bdf8 \
      --text-caps-lock-color=f5bde6 \
      --indicator \
      --indicator-radius 100 \
      --indicator-thickness 7 \
      --effect-blur 25x25 \
      --effect-vignette 0.5:0.5 \
      --ring-color b7bdf8 \
      --key-hl-color f5bde6 \
      --line-color 00000000 \
      --inside-color 00000088 \
      --separator-color 00000000
  '';
in {
  home.packages = [
    pkgs.swaylock-effects
    swaylockThemed
  ];
}
