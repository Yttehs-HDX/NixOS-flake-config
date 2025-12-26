{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.cryptsetup;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.cryptsetup ];
}
