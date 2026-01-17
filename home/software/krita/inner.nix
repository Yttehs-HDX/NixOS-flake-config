{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "krita";
  };
in mkSoftware {

  home.packages = [ pkgs.krita ];
}
