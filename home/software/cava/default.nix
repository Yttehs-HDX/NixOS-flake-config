{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "cava";
  };
  inner = import ./inner.nix { inherit config; };
in mkSoftware inner
