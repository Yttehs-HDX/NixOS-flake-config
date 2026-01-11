{ lib, profile, ... }:

let
  mkAuxPackage = import ../_lib/mkAuxPackage.nix;

in
mkAuxPackage {
  inherit lib profile;
  name = "pulseaudio";
  inner = ./inner.nix;
}
