{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "figlet";
  };
in mkSoftware {

  home.packages = [ pkgs.figlet ];
}
