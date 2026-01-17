{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "dig";
  };
in mkSoftware {

  home.packages = [ pkgs.dig ];
}
