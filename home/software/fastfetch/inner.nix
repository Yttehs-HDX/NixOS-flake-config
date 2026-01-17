{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "fastfetch";
  };
in mkSoftware {

  home.packages = [ pkgs.fastfetch ];
}
