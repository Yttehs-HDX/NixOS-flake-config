{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "command-not-found";
  };
in mkSoftware {

  programs.command-not-found.enable = true;
}
