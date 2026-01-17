{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "osu-lazer-bin";
  };
in mkSoftware {

  home.packages = [ pkgs.osu-lazer-bin ];
}
