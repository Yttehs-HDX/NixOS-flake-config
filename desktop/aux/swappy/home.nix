{ lib, profile, ... }:

let mkAuxPackage = import ../_lib/mkAuxPackage.nix;

in mkAuxPackage {
  inherit lib profile;
  name = "swappy";
  inner = ./inner-home.nix;
}
