{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "jq";
  };
in mkSoftware {

  home.packages = [ pkgs.jq ];
}
