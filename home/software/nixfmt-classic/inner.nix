{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "nixfmt-classic";
  };
in mkSoftware {

  home.packages = [ pkgs.nixfmt-classic ];
}
