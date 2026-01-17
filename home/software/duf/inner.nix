{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "duf";
  };
in mkSoftware {

  home.packages = [ pkgs.duf ];
}
