{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.nixfmt-classic;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.nixfmt-classic ];
}
