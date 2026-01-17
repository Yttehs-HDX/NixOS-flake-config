{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "android-tools";
  };
in mkSoftware {

  home.packages = [ pkgs.android-tools ];
}
