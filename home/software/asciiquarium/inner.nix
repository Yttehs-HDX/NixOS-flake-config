{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "asciiquarium";
  };
in mkSoftware {

  home.packages = [ pkgs.asciiquarium ];
}
