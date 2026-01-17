{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "kitty";
  };
  inner = import ./inner.nix { inherit config; };
in mkSoftware inner
