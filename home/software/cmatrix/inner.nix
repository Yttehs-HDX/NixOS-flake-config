{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "cmatrix";
  };
in mkSoftware {

  home.packages = [ pkgs.cmatrix ];
}
