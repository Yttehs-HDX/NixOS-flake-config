{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "cryptsetup";
  };
in mkSoftware {

  home.packages = [ pkgs.cryptsetup ];
}
