{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "htop";
  };
in mkSoftware {

  programs.htop.enable = true;
}
