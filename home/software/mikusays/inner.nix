{ lib, config, nur, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.mikusays;
in
mkWhenEnabled cfg.enable {
  home.packages = [ nur.zerozawa.mikusays ];
}
