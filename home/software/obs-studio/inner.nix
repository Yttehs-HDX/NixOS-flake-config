{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.obs-studio;
in
mkWhenEnabled cfg.enable {
  programs.obs-studio = { enable = true; };
}
