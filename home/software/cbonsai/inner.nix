{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "cbonsai";
  };
in mkSoftware {

  home.packages = [ pkgs.cbonsai ];
}
