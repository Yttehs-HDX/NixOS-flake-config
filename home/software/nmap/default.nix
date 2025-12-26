{ lib, ... }:

let
  mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix { inherit lib; };
in
mkSoftwarePackage {
  name = "nmap";
  inner = ./inner.nix;
}
