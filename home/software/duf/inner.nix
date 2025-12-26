{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.duf;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.duf ];
}
