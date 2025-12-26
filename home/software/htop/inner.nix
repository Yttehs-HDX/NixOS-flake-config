{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.htop;
in
mkWhenEnabled cfg.enable {
  programs.htop.enable = true;
}
