{ config, lib, pkgs, hexecute, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "hexecute";
  };
in mkSoftware {

  home.packages =
    [ hexecute.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
