{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "bat";
  };
in mkSoftware {

  programs.bat.enable = true;
  home.sessionVariables.PAGER = "${pkgs.bat}/bin/bat";
}
