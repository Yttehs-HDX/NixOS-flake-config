{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "qq";
  };
in mkSoftware {

  home.packages = [ pkgs.qq ];
}
