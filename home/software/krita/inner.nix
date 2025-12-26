{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.krita;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.krita ];
}
