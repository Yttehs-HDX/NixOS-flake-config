{ lib, profile, ... }:

let
  mkAuxPackage = import ../_lib/mkAuxPackage.nix;

in
mkAuxPackage {
  inherit lib profile;
  name = "nerd-fonts-jetbrains-mono";
  inner = ./inner.nix;
}
