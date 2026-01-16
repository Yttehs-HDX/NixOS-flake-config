{ lib, profile, ... }:

let mkAuxPackage = import ../_lib/mkAuxPackage.nix;
in mkAuxPackage {
  inherit lib profile;
  name = "gnome-keyring";
  inner = ./inner-nixos.nix;
}
