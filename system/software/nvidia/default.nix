{ lib, profile, ... }:

let mkSystemSoftwareModule = import ../_lib/mkSystemSoftwareModule.nix;
in mkSystemSoftwareModule {
  inherit lib profile;
  name = "nvidia";
  inner = ./inner.nix;
}
