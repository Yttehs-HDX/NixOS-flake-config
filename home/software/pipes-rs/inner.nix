{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.pipes-rs;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.pipes-rs ];
}
