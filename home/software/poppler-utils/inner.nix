{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "poppler-utils";
  };
in mkSoftware {

  home.packages = [ pkgs.poppler-utils ];
}
