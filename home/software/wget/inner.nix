{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.wget;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.wget ];
}
