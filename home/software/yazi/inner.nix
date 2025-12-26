{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.yazi;
in
mkWhenEnabled cfg.enable {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
}
