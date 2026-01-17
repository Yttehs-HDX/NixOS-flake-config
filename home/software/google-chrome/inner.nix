{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "google-chrome";
  };
in mkSoftware {

  home.packages = [ pkgs.google-chrome ];
}
