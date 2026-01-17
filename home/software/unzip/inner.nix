{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "unzip";
  };
in mkSoftware {

  home.packages = [ pkgs.unzip ];
}
