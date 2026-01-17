{ config, lib, pkgs, ... }:

let
  mkSession = import ../_lib/mkSession.nix {
    inherit lib config;
    name = "hyprland";
  };
  inner = import ./inner-home { inherit pkgs; };
in mkSession inner
