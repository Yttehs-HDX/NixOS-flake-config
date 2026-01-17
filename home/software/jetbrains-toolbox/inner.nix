{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "jetbrains-toolbox";
  };
in mkSoftware {

  home.packages = [ pkgs.jetbrains-toolbox ];
}
