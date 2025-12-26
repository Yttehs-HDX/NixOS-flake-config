{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.lazygit;
in
mkWhenEnabled cfg.enable {
  programs.lazygit.enable = true;
}
