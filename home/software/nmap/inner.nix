{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "nmap";
  };
in mkSoftware {

  home.packages = [ pkgs.nmap ];
}
