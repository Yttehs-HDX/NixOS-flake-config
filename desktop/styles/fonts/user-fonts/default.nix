{ lib, profile, ... }:

let mkFont = import ../_lib/mkFont.nix;
in mkFont {
  inherit lib profile;
  inner = ./inner-home.nix;
}
