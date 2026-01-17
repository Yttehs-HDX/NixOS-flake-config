{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "universal-android-debloater";
  };
in mkSoftware {

  home.packages = [ pkgs.universal-android-debloater ];
}
