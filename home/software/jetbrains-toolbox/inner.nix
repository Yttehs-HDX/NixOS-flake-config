{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.jetbrains-toolbox;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.jetbrains-toolbox ];
}
