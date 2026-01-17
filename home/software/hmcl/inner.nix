{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "hmcl";
  };
in mkSoftware {

  home.packages = [ pkgs.hmcl ];
}
