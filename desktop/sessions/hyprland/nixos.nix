{ config, lib, hostname, ... }:

let
  mkSession = import ../_lib/mkSession.nix {
    inherit lib config hostname;
    name = "hyprland";
  };
  inner = import ./inner-nixos.nix { };
in mkSession inner
