{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "htop";
  };
  inner = import ./inner.nix { };
in mkSoftware inner
