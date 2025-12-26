{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.osu-lazer-bin;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.osu-lazer-bin ];
}
