{ lib, profile, ... }:

let mkSystemSoftwareModule = import ../_lib/mkSystemSoftwareModule.nix;
in mkSystemSoftwareModule {
  inherit lib profile;
  name = "waydroid";
  inner = ./inner.nix;
}
