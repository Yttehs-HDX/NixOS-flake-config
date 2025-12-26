{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.universal-android-debloater;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.universal-android-debloater ];
}
