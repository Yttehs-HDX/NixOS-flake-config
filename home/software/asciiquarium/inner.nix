{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.asciiquarium;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.asciiquarium ];
}
