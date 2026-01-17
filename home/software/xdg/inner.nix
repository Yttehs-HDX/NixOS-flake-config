{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "xdg";
  };
in mkSoftware { xdg.userDirs.enable = true; }
