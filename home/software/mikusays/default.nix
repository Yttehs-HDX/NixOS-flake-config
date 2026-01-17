{ config, lib, nur, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "mikusays";
  };
  inner = import ./inner.nix { inherit nur; };
in mkSoftware inner
