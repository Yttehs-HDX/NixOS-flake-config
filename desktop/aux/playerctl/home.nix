{ lib, profile, ... }:

let mkAuxPackage = import ../_lib/mkAuxPackage.nix;

in mkAuxPackage {
  inherit lib profile;
  name = "playerctl";
  inner = ./inner-home.nix;
}
