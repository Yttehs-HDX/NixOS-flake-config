{ lib, profile, ... }:

let mkAuxPackage = import ../_lib/mkAuxPackage.nix;

in mkAuxPackage {
  inherit lib profile;
  name = "hyprpicker";
  inner = ./inner-home.nix;
}
