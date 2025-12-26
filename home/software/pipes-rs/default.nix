{ lib, ... }:

let
  mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix { inherit lib; };
in
mkSoftwarePackage {
  name = "pipes-rs";
  inner = ./inner.nix;
}
