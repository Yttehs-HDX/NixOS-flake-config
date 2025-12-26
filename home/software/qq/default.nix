{ lib, ... }:

let
  mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix { inherit lib; };
in
mkSoftwarePackage {
  name = "qq";
  inner = ./inner.nix;
}
