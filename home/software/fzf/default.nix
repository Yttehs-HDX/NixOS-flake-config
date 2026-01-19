{ config, lib, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "fzf";
  };
  inner = import ./inner.nix { };
in mkSoftware inner
