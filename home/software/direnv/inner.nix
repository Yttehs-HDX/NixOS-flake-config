{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.direnv;
in
mkWhenEnabled cfg.enable {
  programs.direnv = {
    enable = true;
    silent = true;

    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
