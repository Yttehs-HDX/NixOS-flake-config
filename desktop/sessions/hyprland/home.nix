{ lib, profile, ... }:

let
  mkSession = import ../_lib/mkSession.nix;
in
mkSession {
  inherit lib profile;
  name = "hyprland";
  inner = ./home-inner.nix;
}
