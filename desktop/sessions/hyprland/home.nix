{ config, lib, pkgs, username, ... }:

let
  mkSession = import ../_lib/mkSession.nix {
    inherit lib config username;
    name = "hyprland";
  };
  inner = import ./inner-home { inherit pkgs; };
in mkSession inner
