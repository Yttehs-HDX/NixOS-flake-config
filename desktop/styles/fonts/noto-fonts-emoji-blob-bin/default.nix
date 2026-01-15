{ lib, profile, ... }:

let
  mkFont = import ../_lib/mkFont.nix;
in
mkFont {
  inherit lib profile;
  name = "noto-fonts-emoji-blob-bin";
  inner = ./inner-home.nix;
}
