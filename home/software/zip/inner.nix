{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "zip";
  };
in mkSoftware {

  home.packages = [ pkgs.zip ];
}
