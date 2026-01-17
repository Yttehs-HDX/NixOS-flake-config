{ config, lib, ... }:

let
  mkSession = import ../_lib/mkSession.nix {
    inherit lib config;
    name = "hyprland";
  };
  inner = import ./inner-nixos.nix { };
in mkSession inner
