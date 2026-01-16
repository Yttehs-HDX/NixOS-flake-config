{ lib, profile, ... }:

let
  mkSystemSoftwareModule = import ../_lib/mkSystemSoftwareModule.nix;
in
mkSystemSoftwareModule {
  inherit lib profile;
  name = "refind";
  inner = ./inner.nix;
}
