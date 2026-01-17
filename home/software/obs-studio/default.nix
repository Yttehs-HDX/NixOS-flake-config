{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "obs-studio";
  };
  inner = import ./inner.nix { };
in mkSoftware inner
