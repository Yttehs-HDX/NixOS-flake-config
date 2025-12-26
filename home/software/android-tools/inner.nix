{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.android-tools;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.android-tools ];
}
