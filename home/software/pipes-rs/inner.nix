{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "pipes-rs";
  };
in mkSoftware {

  home.packages = [ pkgs.pipes-rs ];
}
