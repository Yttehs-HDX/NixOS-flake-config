{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.poppler-utils;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.poppler-utils ];
}
