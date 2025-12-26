{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.tmux;
in
mkWhenEnabled cfg.enable {
  programs.tmux.enable = true;
}
