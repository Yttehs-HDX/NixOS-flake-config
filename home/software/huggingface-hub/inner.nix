{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.huggingface-hub;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.python313Packages."huggingface-hub" ];
}
