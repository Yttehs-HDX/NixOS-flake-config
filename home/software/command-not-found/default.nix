{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "command-not-found";
  };
  inner = import ./inner.nix { };
in mkSoftware inner
