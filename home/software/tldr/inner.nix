{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "tldr";
  };
in mkSoftware {

  home.packages = [ pkgs.tldr ];
}
