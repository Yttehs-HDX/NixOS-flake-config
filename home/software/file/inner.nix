{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.file;
in
mkWhenEnabled cfg.enable {
  home.packages = with pkgs; [
    file
  ];
}
