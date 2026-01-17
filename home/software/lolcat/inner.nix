{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "lolcat";
  };
in mkSoftware {

  home.packages = [ pkgs.lolcat ];
}
