{ lib, profile, ... }:

let mkHomeAuxModule = import ../_lib/mkHomeAuxModule.nix;
in mkHomeAuxModule {
  inherit lib profile;
  name = "neovim";
  inner = ./inner.nix;
}
