{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.hmcl;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.hmcl ];
}
