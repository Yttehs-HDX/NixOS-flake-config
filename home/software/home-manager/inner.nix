{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.home-manager;
in
mkWhenEnabled cfg.enable {
  programs.home-manager.enable = true;
}
