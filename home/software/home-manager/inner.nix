{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "home-manager";
  };
in mkSoftware {

  programs.home-manager.enable = true;
}
