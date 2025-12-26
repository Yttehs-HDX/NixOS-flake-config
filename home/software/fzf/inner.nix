{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.fzf;
in
mkWhenEnabled cfg.enable {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
