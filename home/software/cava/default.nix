{ config, lib, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "cava";
  };
  inner = import ./inner.nix { inherit config; };
in mkSoftware inner
