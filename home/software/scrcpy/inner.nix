{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "scrcpy";
  };
in mkSoftware {

  home.packages = [ pkgs.scrcpy ];
}
