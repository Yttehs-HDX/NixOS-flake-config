{ lib, profile, ... }:

let mkAuxPackage = import ../_lib/mkAuxPackage.nix;
in mkAuxPackage {
  inherit lib profile;
  name = "pipewire";
  inner = ./inner-nixos.nix;
}
