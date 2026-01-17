{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "file";
  };
in mkSoftware {

  home.packages = with pkgs; [ file ];
}
