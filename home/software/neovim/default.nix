{ lib, profile, ... }:

let
  mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix;
in
{
  imports = [
    (mkSoftwarePackage {
      inherit lib profile;
      name = "neovim";
      inner = ./inner.nix;
    })
  ];
}
