{ lib, profile, ... }:

let mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix;
in mkSoftwarePackage {
  inherit lib profile;
  name = "figlet";
  inner = ./inner.nix;
}
