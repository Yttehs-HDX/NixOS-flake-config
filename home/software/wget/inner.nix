{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "wget";
  };
in mkSoftware {

  home.packages = [ pkgs.wget ];
}
