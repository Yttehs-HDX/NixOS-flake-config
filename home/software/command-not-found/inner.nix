{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.command-not-found;
in
mkWhenEnabled cfg.enable {
  programs.command-not-found.enable = true;
}
