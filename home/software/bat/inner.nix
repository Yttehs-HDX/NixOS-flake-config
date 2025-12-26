{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.bat;
in
mkWhenEnabled cfg.enable {
  programs.bat.enable = true;
  home.sessionVariables.PAGER = "${pkgs.bat}/bin/bat";
}
