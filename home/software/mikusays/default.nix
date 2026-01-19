{ config, lib, nur, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "mikusays";
  };
  inner = import ./inner.nix { inherit nur; };
in mkSoftware inner
