{ config, lib, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "kitty";
  };
  inner = import ./inner.nix { inherit config; };
in mkSoftware inner
