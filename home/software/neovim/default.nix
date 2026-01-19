{ config, lib, pkgs, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "neovim";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
