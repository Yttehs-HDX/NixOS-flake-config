{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.zip;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.zip ];
}
