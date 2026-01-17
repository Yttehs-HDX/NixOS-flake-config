{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "unrar";
  };
in mkSoftware {

  home.packages = [ pkgs.unrar ];
}
