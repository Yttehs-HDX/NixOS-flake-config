{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.translate-shell;
in
mkWhenEnabled cfg.enable {
  programs.translate-shell.enable = true;
}
