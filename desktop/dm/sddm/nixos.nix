{ config, lib, hostname, pkgs, ... }:

let
  mkDm = import ../_lib/mkDisplayManager.nix {
    inherit lib config hostname;
    name = "sddm";
  };
  inner = import ./inner-nixos.nix { inherit config pkgs; };
in mkDm inner
