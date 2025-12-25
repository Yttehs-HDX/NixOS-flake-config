{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.git;
in
mkWhenEnabled cfg.enable {
  programs.git = {
    enable = true;
    settings = { alias = { lazy = "!lazygit"; }; };
  };
}
